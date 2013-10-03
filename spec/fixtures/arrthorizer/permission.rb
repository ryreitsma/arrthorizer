module Arrthorizer
  class Permission
    attr_accessor :role, :privilege_set

    def self.add(&block)
      yield new
    end
  end
end
