class PermissionFactory
  def self.allow_a(role)
    PermissionCreator.new(role)
  end

  class PermissionCreator
    attr_reader :role

    def initialize(role)
      @role = role
    end

    def to_use(privilege_set_name)
      Arrthorizer::Permission.add do |permission|
        permission.role = self.role
        permission.privilege_set = privilege_set_name
      end
    end
  end
end

