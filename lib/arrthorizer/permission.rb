require 'arrthorizer/privilege_set'

module Arrthorizer
  class Permission
    attr_accessor :role, :privilege_set

    InvalidPermission = Class.new(StandardError)

    def self.grant(privilege_set, config = {})
      permission = new

      permission.privilege_set = PrivilegeSet.find_by_name(privilege_set)
      permission.role = config[:to]

      if permission.valid?
        # TODO: register this permission somewhere
        # maybe permissions do not have a privilege_set at all,
        # but are instead sorted in buckets for each privilege set?
        #
        # But maybe the Permission class is responsible for finding
        # permissions for a given privilege_set.
        #
        # It's also important here to think about revoking. How does
        # occur? Does it 'invalidate' the permission and leave it in
        # existence, or does it actually 'delete' the object?
      else
        raise InvalidPermission
      end
    end

    def valid?
      role.is_a?(Arrthorizer::Role) && privilege_set.is_a?(Symbol)
    end
  end
end
