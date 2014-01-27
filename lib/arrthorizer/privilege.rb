module Arrthorizer
  class Privilege
    attr_reader :name

    def initialize(attrs)
      @name = attrs[:name].to_s

      (attrs[:roles] || []).each do |role|
        self.make_accessible_to(role)
      end

      self.class.register(self)
    end

    def self.get(name_or_privilege)
      repository.fetch(name_or_privilege)
    end

    def make_accessible_to(role)
      permitted_roles.add(role)
    end

    def accessible_to?(role)
      !!permitted_roles.fetch(role) { false }
    end

    def permitted_roles
      @permitted_roles ||= Repository.new
    end

    protected
    def self.register(privilege)
      repository.add(privilege)
    end

    def self.repository
      @repository ||= Repository.new
    end
  end
end
