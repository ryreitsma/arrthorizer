require "spec_helper"

describe Arrthorizer::Repository do
  subject(:repository) { Arrthorizer::Repository.new(raise_on_missing: raise_on_missing) }

  context "when the requested value is not in the Repository" do
    context "and the Repository was configured to raise on missing objects" do
      let(:raise_on_missing) { true }

      it "raises an Arrthorizer::Repository::NotFound" do
        expect {
          repository.get("some_value")
        }.to raise_error(Arrthorizer::Repository::NotFound)
      end
    end

    context "and the Repository was configured to safely handle missing objects" do
      subject(:repository) { Arrthorizer::Repository.new(raise_on_missing: false) }

      it "simply returns nil" do
        expect(repository.get("some_value")).to be_nil
      end
    end
  end
end
