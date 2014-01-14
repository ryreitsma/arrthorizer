require "arrthorizer/version"

module Arrthorizer
  autoload :ArrthorizerException,     "arrthorizer/arrthorizer_exception"

  autoload :Repository,               "arrthorizer/repository"

  autoload :Role,                     "arrthorizer/role"
  autoload :ContextRole,              "arrthorizer/context_role"
  autoload :GenericRole,              "arrthorizer/generic_role"

  autoload :Permission,               "arrthorizer/permission"
  autoload :PrivilegeSet,             "arrthorizer/privilege_set"

  autoload :ContextBuilder,           "arrthorizer/context_builder"
  autoload :Context,                  "arrthorizer/context"

  autoload :Rails,                    "arrthorizer/rails"

  def self.configure(&block)
    self.tap(&block)
  end
end
