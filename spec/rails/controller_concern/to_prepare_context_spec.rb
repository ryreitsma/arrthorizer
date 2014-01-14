require "spec_helper"

describe Arrthorizer::Rails::ControllerConcern do
  describe :to_prepare_context do
    let(:controller_class) { Class.new(ApplicationController) }
    let(:expected_context_builder_type) { Arrthorizer::Rails::ControllerContextBuilder }

    it "adds a ControllerContextBuilder to the class" do
      expected_context_builder = an_instance_of(expected_context_builder_type)

      expect {
        controller_class.to_prepare_context do end
      }.to change { controller_class.arrthorizer_context_builder }.to(expected_context_builder)
    end

    context "when no configuration block is provided" do
      specify "an Arrthorizer::Rails::ConfigurationError is raised" do
        expect {
          controller_class.to_prepare_context
        }.to raise_error(Arrthorizer::ContextBuilder::ConfigurationError)
      end
    end
  end
end
