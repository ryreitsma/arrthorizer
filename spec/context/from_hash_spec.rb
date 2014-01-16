require "spec_helper"

describe Arrthorizer::Context do
  describe :from_hash do
    let(:key) { 'key' }
    let(:value) { 'value' }
    let(:hash) { { key => value } }

    context "when a plain old hash is provided" do
      it "returns an Arrthorizer::Context" do
        result = Arrthorizer::Context.from_hash(hash)

        result.should be_an Arrthorizer::Context
      end

      describe "the returned Arrthorizer::Context" do
        let(:result) { Arrthorizer::Context.from_hash(hash) }

        specify "it contains the same key-value pairs" do
          result.send(key).should == value
        end
      end
    end

    context "when an Arrthorizer::Context is provided" do
      let(:param) { Arrthorizer::Context.new(hash) }

      specify "that context is returned unmodified" do
        Arrthorizer::Context.from_hash(param).should be(param)
      end
    end
  end
end
