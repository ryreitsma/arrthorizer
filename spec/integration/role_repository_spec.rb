require 'spec_helper'

describe Arrthorizer::RoleRepository do
  context "when a new ContextRole class is created" do
    let(:context_role) { class TestRole < Arrthorizer::ContextRole; end; TestRole.instance }

    specify "that role is added to the RoleRepository" do
      Arrthorizer::RoleRepository.should include(context_role.name)
    end

    after :each do
      if defined?(TestRole)
        Object.send(:remove_const, :TestRole)
      end
    end
  end
end
