require "spec_helper"

describe Arrthorizer::ContextBuilder do
  describe :initialize do
    context "when no builder block is provided" do
      specify "an Arrthorizer::ContextBuilder::ConfigurationError is raised" do
        expect {
          Arrthorizer::ContextBuilder.new
        }.to raise_error(Arrthorizer::ContextBuilder::ConfigurationError)
      end
    end
  end
end
