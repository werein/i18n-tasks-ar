require 'test_helper'

describe 'models' do
  before do 
    class MyClass < ActiveRecord::Base ; end
    class MyClass::SubClass < ActiveRecord::Base ; end
    class MyClass::SubClass::YetAnotherClass < ActiveRecord::Base ; end
  end

  it 'should map models' do 
    I18n::Tasks::Ar::Model.names.must_equal(%w(MyClass MyClass::SubClass MyClass::SubClass::YetAnotherClass))
  end

  it 'should generate hash from names' do 
    result = {
      'my_class' => { 'one' => 'MyClass', 'other' => 'MyClasses' },
      'my_class/sub_class' => { 'one' => 'SubClass', 'other' => 'SubClasses' },
      'my_class/sub_class/yet_another_class' => { 'one' => 'YetAnotherClass', 'other' => 'YetAnotherClasses' }
    }

    I18n::Tasks::Ar::Model.hash.must_equal result
  end

  it 'should generate translatable name' do 
    I18n::Tasks::Ar::Model.slashed('MyClass::SubClass').must_equal('my_class/sub_class')
  end

  it 'should resolve model name' do 
    I18n::Tasks::Ar::Model.real_name('MyClass::SubClass').must_equal('SubClass')
  end

  it 'should generate proper final hash' do 
    result = {
      'en' => {
        'activerecord' => {
          'models' => {}
        }
      }
    }
    I18n::Tasks::Ar::Model.stubs(:hash).returns({})
    I18n::Tasks::Ar::Model.final_hash('en').must_equal result
  end
end