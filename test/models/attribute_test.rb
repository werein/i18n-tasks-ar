require 'test_helper'

describe 'models' do
  before do 
    class MyClass < ActiveRecord::Base ; end
    class MyClass::SubClass < ActiveRecord::Base ; end
    MyClass.stubs(:attribute_names).returns(['first_attribute', 'second_attribute'])
    MyClass::SubClass.stubs(:attribute_names).returns(['id'])
  end

  it 'should geneate hash based on model and attributes' do
    result = { 'MyClass' => ['first_attribute', 'second_attribute'], 'MyClass::SubClass' => ['id'] }
    I18n::Tasks::Ar::Attribute.names.must_equal result
  end

  it 'should generate hash from names' do 
    result = {
      'my_class' => { 'first_attribute' => 'First attribute', 'second_attribute' => 'Second attribute' },
      'my_class/sub_class' => { 'id' => 'Id' }
    }

    I18n::Tasks::Ar::Attribute.hash.must_equal result
  end

  it 'should generate proper final hash' do 
    result = {
      'en' => {
        'activerecord' => {
          'attributes' => {}
        }
      }
    }
    I18n::Tasks::Ar::Attribute.stubs(:hash).returns({})
    I18n::Tasks::Ar::Attribute.final_hash('en').must_equal result
  end
end