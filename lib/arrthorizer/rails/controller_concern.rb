module Arrthorizer
  module Rails
    module ControllerConcern
      extend ActiveSupport::Concern

      included do
        class_attribute :arrthorizer_context_builder, instance_writer: false

        ##
        # This is a hook method that provides access to the context for a
        # given HTTP request. For each request, an Arrthorizer::Context object is
        # built and provided to all ContextRoles that are configured as having
        # access to the given controller action.
        def arrthorizer_context
          arrthorizer_context_builder.build_for(self)
        end

        protected :arrthorizer_context, :arrthorizer_context_builder
      end

      module ClassMethods
        ##
        # This is the configuration method for building Arrthorizer contexts from HTTP requests.
        # The developer specifies how contexts for authorization checks should be built
        # by providing a block to this method. For more information, check the documentation
        # on Arrthorizer::Rails::ControllerContextBuilder
        def to_prepare_context(&block)
          self.arrthorizer_context_builder = Arrthorizer::Rails::ControllerContextBuilder.new(&block)
        end
      end
    end
  end
end
