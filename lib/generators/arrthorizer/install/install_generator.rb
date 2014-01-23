module Arrthorizer
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def create_roles_dir
        create_file gitkeep_for(roles_dir), ''
      end

      def create_config_file
        copy_file "config.yml", "config/arrthorizer.yml"
      end

    protected
      def gitkeep_for(directory)
        directory.join('.gitkeep')
      end

      def roles_dir
        ::Rails.root.join('app', 'roles')
      end
    end
  end
end
