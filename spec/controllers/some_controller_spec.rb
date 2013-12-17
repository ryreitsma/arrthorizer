require 'spec_helper'

describe SomeController do
  describe :some_action do
    let!(:privilege) { create_privilege_for(SomeController, :some_action) }
    let!(:current_user) { mock("user") }

    before do
      controller.stub(:current_user) { current_user }
    end

    describe "generic roles" do
      let!(:generic_role) { create_generic_role }

      context "when the role is linked to the privilege" do
        before do
          add_role_to_privilege( generic_role, privilege )
        end

        context "when I am a member of the required generic role" do
          before do
            add_user_to_generic_role(current_user, generic_role)
          end

          it "succeeds" do
            get :some_action

            response.should be_success
          end
        end

        context "when I am not a member of the required generic role" do
          it "fails" do
            get :some_action

            response.should be_forbidden
          end
        end
      end

      context "when I am only a member of an unrelated generic role" do
        before do
          other_privilege = create_privilege_for(SomeController, :something)
          add_role_to_privilege(generic_role, other_privilege)
          add_user_to_generic_role(current_user, generic_role)
        end

        it "fails" do
          response.should be_forbidden
        end
      end
    end

    describe "context roles" do
      let!(:context_role) do
        create_context_role(:role) do |context|
          # This can be any type of check, e.g.:
          #   blog = Blog.find(context[:id])
          #   blog.author == context[:current_user]

          # For the purpose of this test, just do a simple check:
          # is the param :some_param equal to true.
          context[:some_param] == true
        end
      end

      context "when the role is linked to the privilege" do
        before do
          add_role_to_privilege( context_role, privilege )
        end

        context "when I supply the correct 'some_param' param" do
          let(:allow_request) { true }

          it "succeeds" do
            get :some_action, some_param: allow_request

            response.should be_success
          end
        end

        context "when I do not supply the correct 'some_param' param" do
          let(:allow_request) { "something else" }

          it "succeeds" do
            get :some_action, some_param: allow_request

            response.should be_forbidden
          end
        end
      end

      context "when the role is linked to a different privilege" do
        before do
          other_privilege = create_privilege_for(SomeController, :something)
          add_role_to_privilege( context_role, other_privilege )
        end

        context "when I supply the correct 'some_param' param" do
          let(:allow_request) { true }

          it "still fails" do
            get :some_action, some_param: allow_request

            response.should be_forbidden
          end
        end
      end
    end
  end

  private
  def create_privilege_for(controller, action)
    # stub
  end

  def create_generic_role
    # stub
  end

  def create_context_role(name, &block)
    # stub
  end

  def add_role_to_privilege( role, privilege )
    Arrthorizer::Permission.grant(privilege, to: role)
  end

  def add_user_to_generic_role( user, generic_role )
    # stub
  end
end
