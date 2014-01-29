require 'spec_helper'

describe Arrthorizer::Rails::ControllerConcern do
  let(:controller_class) { Class.new(SomeController) }
  let(:controller) { controller_class.new }
  let(:controller_action){ Arrthorizer::Rails::ControllerAction.new(controller: controller_name, action: action_name)}

  let(:action_name){ "some_action" }
  let(:controller_name){ "some_controller" }
  let(:current_user){ double("user") }
  let(:context){ double("context") }

  before do
    controller.stub(:action_name).and_return(action_name)
    controller.stub(:current_user).and_return(current_user)
    controller.stub(:arrthorizer_context).and_return(context)
    controller.stub(:controller_name).and_return(controller_name)
  end

  describe :authorize do
    context "when no privilege has been defined for the action" do
      it "is forbidden" do
        expect(controller).to receive(:forbidden)

        controller.authorize
      end
    end

    context "when a privilege has been defined for the action" do
      let(:privilege){ Arrthorizer::Privilege.new(name: "test privilege", permitted_roles: permitted_roles) }
      let(:permitted_roles){ Arrthorizer::Repository.new }

      before do
        controller_action.stub(:privilege).and_return(privilege)
      end

      context "but the privilege has no permitted roles" do
        it "is forbidden" do
          expect(controller).to receive(:forbidden)

          controller.authorize
        end
      end

      context "and the privilege has a permitted role"  do
        let(:role){ Arrthorizer::Role.new }

        before do
          permitted_roles.add(role)
        end

        context "and the role applies to the user" do
          before do
            role.stub(:applies_to_user?).with(current_user, context).and_return(true)
          end

          it "is not forbidden" do
            expect(controller).not_to receive(:forbidden)

            controller.authorize
          end
        end

        context "and the role does not apply to the user" do
          before do
            role.stub(:applies_to_user?).with(current_user, context).and_return(false)
          end

          it "is forbidden" do
            expect(controller).to receive(:forbidden)

            controller.authorize
          end

          context "when the privilege has another permitted role" do
            let(:another_role){ Arrthorizer::Role.new }

            before do
              permitted_roles.add(another_role)
            end


            context "and the role applies to the user" do
              before do
                another_role.stub(:applies_to_user?).with(current_user, context).and_return(true)
              end

              it "is not forbidden" do
                expect(controller).not_to receive(:forbidden)

                controller.authorize
              end
            end

            context "and the role does not apply to the user" do
              before do
                another_role.stub(:applies_to_user?).with(current_user, context).and_return(false)
              end

              it "is forbidden" do
                expect(controller).to receive(:forbidden)

                controller.authorize
              end
            end
          end
        end
      end
    end
  end
end