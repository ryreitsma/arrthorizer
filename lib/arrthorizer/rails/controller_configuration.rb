module Arrthorizer
  module Rails
    class ControllerConfiguration
      Error = Class.new(Arrthorizer::ArrthorizerException)

      def initialize(&block)
        unless block_given?
          raise Error, "No builder block provided to ContextBuilder.new"
        end

        yield self
      end

      def defaults(&block)
        self.defaults_block = block
      end

      def for_action(action, &block)
        add_action_block(action, &block)
      end

      def builder_for(controller)
        Arrthorizer::Rails::ControllerContextBuilder.new(controller: controller, default: defaults_block, action_configs: action_blocks)
      end

    private
      attr_accessor :defaults_block

      def add_action_block(action, &block)
        action_blocks[action] = block
      end

      def action_blocks
        @action_blocks ||= HashWithIndifferentAccess.new
      end
    end
  end
end
