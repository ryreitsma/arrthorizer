module Arrthorizer
  module Rails
    class ControllerContextBuilder < Arrthorizer::ContextBuilder
      attr_accessor :action_configs, :defaults_config, :controller

      def initialize(config)
        self.action_configs = config[:action_configs]
        self.defaults_config = config[:default]
        self.controller = config[:controller]
      end

      def build_for_action(current_action)
        config = action_configs.fetch(current_action, defaults_config)
        context_hash = controller.instance_eval(&config)

        build_from_hash(context_hash)
      end
    end
  end
end
