module I18n
  module Tasks
    module Ar
      module Attribute
        class << self
          
          # Load classes and attributes and transform them into tash
          # 
          #   Attribue.names # => { 'MyClass' => ['first_attribute', 'second_attribute'] }
          # 
          def names
            result = {}
            ActiveRecord::Base.descendants.each do |model|
              result[model.name] = model.attribute_names
            end
            result
          end

          # 
          # Generate hash with models and attributes transformed into i18n structure
          # 
          #   Attribute.hash # => { 'my_model/subclass' => { 'id' => 'ID', 'attribute_name' => 'Attribute name' } }
          # 
          def hash
            if !names.empty?
              result = {}
              names.each do |key, value|
                hash_name = Model.slashed(key)
                result[hash_name] = {}
                value.each do |attribute|
                  result[hash_name].merge!({ attribute => attribute.gsub('_', ' ').capitalize })
                end
              end
              result
            end
          end

          # 
          # Generate final hash with translatable structure
          # 
          #   Attribute.final_hash('en') # => { 'en' =>  { 'activerecord' => { 'attributes' => { ... } } } }
          # 
          # @param  lang [String] [Translation locale]
          # 
          def final_hash lang
            result = {}
            result[lang.to_s] = { 'activerecord' => { 'attributes' => hash } }
            result
          end
        end
      end
    end
  end
end