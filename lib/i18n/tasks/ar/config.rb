module I18n
  module Tasks
    module Ar
      module Config
        include ActiveSupport::Configurable

        config_accessor :locales

        # Reset all configurations to defaults.
        def self.reset
          file = 'config/i18n-tasks.yml' if File.exist?('config/i18n-tasks.yml')
          file = 'config/i18n-tasks-ar.yml' if File.exist?('config/i18n-tasks-ar.yml')

          if file
            config = YAML.load_file(file)
            self.locales = config['locales']
          else
            self.locales = ['en']
          end
        end

        # Set default values for configuration options on load
        self.reset
      end
    end
  end
end