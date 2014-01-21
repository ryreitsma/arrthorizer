module Arrthorizer
  module Rails
    autoload :ControllerConfiguration,  "arrthorizer/rails/controller_configuration"
    autoload :ControllerConcern,        "arrthorizer/rails/controller_concern"
    autoload :ControllerContextBuilder, "arrthorizer/rails/controller_context_builder"

  module_function
    def initialize!
      ActionController::Base.send(:include, ControllerConcern)
    end
  end
end
