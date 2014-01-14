require "spec_helper"

require 'arrthorizer/rails'

describe Arrthorizer::Rails do
  describe "controller integration" do
    let(:controller_class) { Class.new(ApplicationController) }

    describe "each controller class" do
      it "responds to :prepare_context" do
        controller_class.should respond_to :to_prepare_context
      end

      it "responds to :arrthorizer_context_builder" do
        controller_class.should respond_to :arrthorizer_context_builder
      end
    end

    describe "each controller" do
      let(:controller) { controller_class.new }

      it "responds to :arrthorizer_context" do
        controller.should respond_to :arrthorizer_context
      end
    end
  end
end
