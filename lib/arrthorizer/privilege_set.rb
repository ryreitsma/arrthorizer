module Arrthorizer
  class PrivilegeSet
    attr_reader :name

    # TODO: ActiveModel en uniqueness van naam validaten?
    def initialize(name)
      @name = name.to_s

      self.class.repository[name] = self
    end

    def self.find_by_name(name)
      self.repository[name] ||= new(name)
    end

  protected
    def self.repository
      @repository ||= {}
    end
  end
end

