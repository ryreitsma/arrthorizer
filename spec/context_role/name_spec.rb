require 'spec_helper'

describe Arrthorizer::ContextRole do
  describe :name do
    context "when the context role is not namespaced" do
      let(:role) { UnnamespacedContextRole.new }

      it "returns a snake_cased version of the class name" do
        expect(role.name).to eql "unnamespaced_context_role"
      end
    end

    context "when the context role is namespaced" do
      let(:role) { Namespaced::ContextRole.new }

      it "returns a snake_cased version of the class name" do
        expect(role.name).to eql "namespaced/context_role"
      end
    end
  end
end
