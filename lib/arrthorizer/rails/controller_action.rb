module Arrthorizer
  module Rails
    class ControllerAction
      ControllerNotDefined = Class.new(Arrthorizer::ArrthorizerException)
      ActionNotDefined = Class.new(Arrthorizer::ArrthorizerException)

      attr_accessor :privilege
      attr_reader :controller, :action

      def initialize(attrs)
        self.controller = attrs.fetch(:controller) { raise ControllerNotDefined }
        self.action = attrs.fetch(:action) { raise ActionNotDefined }
      end

      def name
        [controller, action].join('#')
      end

    private
      attr_writer :controller, :action
    end
  end
end
