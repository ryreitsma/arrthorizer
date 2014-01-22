require "spec_helper"

require_relative 'shared_examples/finding_the_right_role.rb'

describe Arrthorizer::Role do
  describe :get do
    describe "fetching ContextRoles" do
      # this role is a test fixture
      let(:expected_role) { Namespaced::ContextRole.instance }

      context "when a ContextRole class is provided" do
        it_behaves_like "finding the right Role" do
          let(:arg) { expected_role.class }
        end
      end

      context "when the name of a ContextRole instance is provided" do
        it_behaves_like "finding the right Role" do
          let(:arg) { expected_role.name }
        end
      end

      context "when a ContextRole instance is provided" do
        it_behaves_like "finding the right Role" do
          let(:arg) { expected_role }
        end
      end
    end

    context "fetching GenericRoles" do
      let(:expected_role) { GenericRoleFixture }

      context "when a GenericRole is provided" do
        it_behaves_like "finding the right Role" do
          let(:arg) { expected_role }
        end
      end

      context "when the name of a GenericRole is provided" do
        it_behaves_like "finding the right Role" do
          let(:arg) { expected_role.name }
        end
      end
    end
  end
end
