module Arrthorizer
  class Privilege
    attr_reader :name

    def initialize(attrs)
      @name = attrs[:name].to_s
      @roles = attrs.fetch(:roles) { [] }

      self.class.register(self)
    end

    def self.get(name_or_privilege)
      repository.get(name_or_privilege)
    end

    def make_accessible_to(role)
      permitted_roles.add(role)
    end

    def accessible_to?(role)
      !!permitted_roles.get(role)
    end

    protected
    def self.register(privilege)
      repository.add(privilege)
    end

    def self.repository
      @repository ||= Repository.new
    end

    def permitted_roles
      @permitted_roles ||= Repository.new(raise_on_missing: false)
    end
  end
end
