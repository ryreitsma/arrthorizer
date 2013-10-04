require 'arrthorizer/role'
require 'singleton'

module Arrthorizer
  class ContextRole < Role
    include Singleton

    def name
      self.class.name.underscore
    end
  end
end

