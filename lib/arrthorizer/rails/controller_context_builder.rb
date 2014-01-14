module Arrthorizer
  module Rails
    class ControllerContextBuilder < Arrthorizer::ContextBuilder
      def build_from_request(request)
        build
      end
    end
  end
end
