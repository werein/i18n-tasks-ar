module I18n
  module Tasks
    module Ar
      module Model
        class << self
          def names
            Rails.application.eager_load! if Rails.env == 'development' rescue true
            ActiveRecord::Base.descendants.map(&:name)
          end

          def hash
            if !names.empty?
              result = {}
              names.each do |name|
                result[slashed(name)] = { 'one' => real_name(name), 'other' => real_name(name).pluralize }
              end
              result
            else
              nil
            end
          end

          def slashed name
            name.underscore.gsub('::', '/')
          end

          def real_name name
            name.split('::').last
          end

          def final_hash lang
            result = {}
            result[lang.to_s] = { 'activerecord' => { 'models' => hash } }
            result
          end
        end
      end
    end
  end
end
