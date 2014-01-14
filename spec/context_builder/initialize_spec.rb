require "spec_helper"

describe Arrthorizer::ContextBuilder do
  describe :initialize do
    it "yields the new instance to the builder block" do
      expect { |block|
        Arrthorizer::ContextBuilder.new(&block)
      }.to yield_with_args(an_instance_of(Arrthorizer::ContextBuilder))
    end

    context "when no builder block is provided" do
      specify "an Arrthorizer::ContextBuilder::ConfigurationError is raised" do
        expect {
          Arrthorizer::ContextBuilder.new
        }.to raise_error(Arrthorizer::ContextBuilder::ConfigurationError)
      end
    end
  end
end
