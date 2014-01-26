require "spec_helper"

describe Arrthorizer::Repository do
  subject(:repository) { Arrthorizer::Repository.new }

  context "when the requested value is not in the Repository" do
    context "and no default value was specified" do
      it "raises an Arrthorizer::Repository::NotFound" do
        expect {
          repository.fetch("some_value")
        }.to raise_error(Arrthorizer::Repository::NotFound)
      end
    end

    context "and a default value was specified" do
      subject(:repository) { Arrthorizer::Repository.new }
      let(:default) { :default }

      it "returns the default" do
        actual = repository.fetch("some_value") { default }
        expect(actual).to eq(default)
      end
    end
  end
end
