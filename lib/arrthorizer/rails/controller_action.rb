module Arrthorizer
  module Rails
    class ControllerAction
      ControllerNotDefined = Class.new(Arrthorizer::ArrthorizerException)
      ActionNotDefined = Class.new(Arrthorizer::ArrthorizerException)

      attr_accessor :privilege, :controller, :action

      def initialize(attrs)
        self.privilege = attrs[:privilege]
        self.controller = attrs.fetch(:controller) { raise ControllerNotDefined }
        self.action = attrs.fetch(:action) { raise ActionNotDefined }
      end

      def name
        [controller, action].join('#')
      end
    end
  end
end
