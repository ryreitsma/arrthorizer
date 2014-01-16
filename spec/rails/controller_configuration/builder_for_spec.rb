require "spec_helper"

describe Arrthorizer::Rails::ControllerConfiguration do
  let(:controller_class) { Class.new(SomeController) }
  let(:controller) { controller_class.new }

  let(:config_block) { ->(c) { c.defaults do end } }
  let(:config) { Arrthorizer::Rails::ControllerConfiguration.new &config_block }

  describe :build_for do
    it "returns an Arrthorizer::Rails::ControllerContextBuilder" do
      config.builder_for(controller).should be_an Arrthorizer::ContextBuilder
    end
  end
end
