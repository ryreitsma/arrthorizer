require "spec_helper"

describe Arrthorizer::Rails::ControllerContextBuilder do
  let(:controller_class) { Class.new(SomeController) }
  let(:controller) { controller_class.new }

  let(:config) { ->(c) { c.defaults do end } }
  let(:builder) { Arrthorizer::Rails::ControllerContextBuilder.new &config }

  describe :build_for do
    it "returns an Arrthorizer::Context" do
      builder.build_for(controller).should be_an Arrthorizer::Context
    end
  end
end
