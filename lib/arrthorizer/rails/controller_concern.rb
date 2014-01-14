module Arrthorizer
  module Rails
    module ControllerConcern
      extend ActiveSupport::Concern

      included do
        delegate :arrthorizer_context_builder, to: 'self.class'

        ##
        # This is a hook method that provides access to the context for a
        # given HTTP request. For each request, an Arrthorizer::Context object is
        # built and provided to all ContextRoles that are configured as having
        # access to the given controller action.
        def arrthorizer_context
          arrthorizer_context_builder.build_from_request(request)
        end

        protected :arrthorizer_context, :arrthorizer_context_builder
      end

      module ClassMethods
        # how does this work with inheritance again? does cattr_accessor help?
        # possibly do something with inherited callback for parent class and
        # set the instance variable on the child class. Then could we re-open
        # the context-builder in subclasses without wrecking the inherited
        # builder?
        def arrthorizer_context_builder
          @arrthorizer_context_builder
        end

        ##
        # This is the configuration method for building Arrthorizer contexts from HTTP requests.
        # The developer specifies how contexts for authorization checks should be built
        # by providing a block to this method. For more information, check the documentation
        # on Arrthorizer::Rails::ControllerContextBuilder
        def to_prepare_context(&block)
          @arrthorizer_context_builder = Arrthorizer::Rails::ControllerContextBuilder.new(&block)
        end
      end
    end
  end
end
