module Arrthorizer
  module Rails
    class ControllerContextBuilder < Arrthorizer::ContextBuilder
      def defaults(&block)
        self.defaults_block = block
      end

      def build_for(controller)
        context_hash = controller.instance_eval(&defaults_block)

        Arrthorizer::Context.from_hash(context_hash)
      end

    private
      attr_accessor :defaults_block
    end
  end
end
