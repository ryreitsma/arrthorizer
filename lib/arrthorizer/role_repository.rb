require 'singleton'

require 'arrthorizer/context_role'
require 'arrthorizer/generic_role'

module Arrthorizer
  module RoleRepository
    include Enumerable

    def self.include?(role_name)
      storage.include?(role_name)
    end

    def self.each(&block)
      storage.each(&block)
    end

    def self.add(role)
      storage[role.name] = role
    end

  private
    def self.storage
      @storage ||= Hash.new
    end
  end
end

