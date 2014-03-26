module I18n
  module Tasks
    module Ar
      module Generate
        class << self
          def model lang
            result = Model.final_hash(lang).to_yaml
            FileUtils.mkdir_p('config/locales') unless File.exists?('config/locales')
            File.open("config/locales/activerecord.models.#{lang}.yml", 'w+') {|f| f.write(result) }
          end

          def models
            I18n::Tasks::Ar::Config.locales.each{|locale| model(locale)}
          end
        end
      end
    end
  end
end