module Arrthorizer
  class Privilege
    attr_reader :name

    def initialize(name)
      @name = name.to_s

      self.class.register(self)
    end

    def self.get(name_or_privilege)
      repository.get(name_or_privilege)
    end

    def make_accessible_to(role)
      permitted_roles << role
    end

    def accessible_to?(role)
      permitted_roles.include? role
    end

    protected
    def self.register(privilege)
      repository.add(privilege)
    end

    def self.repository
      @repository ||= Repository.new
    end

    def permitted_roles
      @permitted_roles ||= []
    end
  end
end
