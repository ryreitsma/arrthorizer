module Arrthorizer
  module Rails
    autoload :ControllerContextBuilder, "arrthorizer/rails/controller_context_builder"
    autoload :ControllerConcern,        "arrthorizer/rails/controller_concern"

    ActionController::Base.send(:include, ControllerConcern)
  end
end
