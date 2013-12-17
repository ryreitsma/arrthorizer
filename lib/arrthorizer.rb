require "arrthorizer/version"

module Arrthorizer
  autoload :Role,           "arrthorizer/role"
  autoload :ContextRole,    "arrthorizer/context_role"
  autoload :GenericRole,    "arrthorizer/generic_role"
  autoload :RoleRepository, "arrthorizer/role_repository"

  autoload :Permission,     "arrthorizer/permission"
  autoload :PrivilegeSet,   "arrthorizer/privilege_set"

  def self.configure(&block)
    self.tap(&block)
  end
end
