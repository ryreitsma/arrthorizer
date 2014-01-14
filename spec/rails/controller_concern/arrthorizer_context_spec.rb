require "spec_helper"

describe Arrthorizer::Rails::ControllerConcern do
  let(:controller) { SomeController.new }

  describe :arrthorizer_context do
    it "returns an Arrthorizer::Context" do
      controller.send(:arrthorizer_context).should be_a Arrthorizer::Context
    end
  end
end
