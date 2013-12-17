module Arrthorizer
  class PrivilegeSet
    attr_reader :name

    def initialize(name)
      @name = name.to_s

      self.class.register(self)
    end

    def self.get(name_or_privilege_set)
      repository.get(name_or_privilege_set)
    end

    protected
    def self.register(privilege_set)
      repository.add(privilege_set)
    end

    def self.repository
      @repository ||= Repository.new
    end
  end
end
