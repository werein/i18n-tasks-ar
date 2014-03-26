require 'test_helper'

describe 'models' do
  before do 
    I18n::Tasks::Ar::Model.stubs(:hash).returns({'class' => { 'one' => 'Class', 'other' => 'Classes' }})
  end
  after { FileUtils.rm_rf 'config' }

  it 'should save yaml with models' do 
    I18n::Tasks::Ar::Generate.model('en')
    File.exist?('config/locales/activerecord.models.en.yml').must_equal true
  end

  it 'should create multiple locales' do 
    I18n::Tasks::Ar::Config.locales = ['en', 'cs']
    I18n::Tasks::Ar::Generate.expects(:model).twice
    I18n::Tasks::Ar::Generate.models
  end

  it 'should save yaml with attribute with models' do 
    I18n::Tasks::Ar::Generate.attribute('en')
    File.exist?('config/locales/activerecord.attributes.en.yml').must_equal true
  end

  it 'should create multiple locales with attributes' do 
    I18n::Tasks::Ar::Config.locales = ['en', 'cs']
    I18n::Tasks::Ar::Generate.expects(:attribute).twice
    I18n::Tasks::Ar::Generate.attributes
  end
end