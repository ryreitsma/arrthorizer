require 'singleton'

require 'arrthorizer/role'
require 'arrthorizer/role_repository'

module Arrthorizer
  class ContextRole < Role
    include Singleton

    def name
      self.class.name.underscore
    end

    def self.inherited(klass)
      super

      RoleRepository.add(klass.instance)
    end
  end
end

