require "spec_helper"

describe Arrthorizer::Rails::ControllerAction do
  let(:controller_name) { 'some_controller' }
  let(:action_name) { 'some_action' }
  let(:privilege) { Arrthorizer::Privilege.new(name: 'some_privilege') }

  let(:definition) { { controller: controller_name, action: action_name, privilege: privilege } }

  describe :initialize do
    context "when all parameters are properly specified" do
      it "does not raise an error" do
        expect {
          Arrthorizer::Rails::ControllerAction.new(definition)
        }.not_to raise_error
      end
    end

    context "when the controller is not properly specified" do
      before :each do
        definition.delete(:controller)
      end

      it "raises an Arrthorizer::Rails::ControllerAction::ControllerNotDefined" do
        expect {
          Arrthorizer::Rails::ControllerAction.new(definition)
        }.to raise_error(Arrthorizer::Rails::ControllerAction::ControllerNotDefined)
      end
    end

    context "when the action is not properly specified" do
      before :each do
        definition.delete(:action)
      end

      it "does raises an Arrthorizer::Rails::ControllerAction::ActionNotDefined" do
        expect {
          Arrthorizer::Rails::ControllerAction.new(definition)
        }.to raise_error(Arrthorizer::Rails::ControllerAction::ActionNotDefined)
      end
    end

    context "when the privilege is not properly specified" do
      # This is actually a circumstance which does not occur in reality, since it is not
      # possible to configure controller actions without a parent privilege in the YAML
      # file. However, it is conceptually an error: there might be a controller action
      # which is not part of any privilege (for example, controllers from engines that
      # are not supposed to be actually used
      before :each do
        definition.delete(:privilege)
      end

      it "does not raise an error" do
        expect {
          Arrthorizer::Rails::ControllerAction.new(definition)
        }.not_to raise_error
      end
    end
  end
end
