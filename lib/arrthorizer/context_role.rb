require 'arrthorizer/role'

module Arrthorizer
  class ContextRole < Role
    def name
      self.class.name.underscore
    end
  end
end

