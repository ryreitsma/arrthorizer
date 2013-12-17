module Arrthorizer
  class Permission
    def self.grant(privilege_set, config = {})
      raise NotImplementedError
    end
  end
end
