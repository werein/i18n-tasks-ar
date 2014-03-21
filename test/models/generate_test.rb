require 'test_helper'

describe 'models' do
  before do 
    I18n::Tasks::Ar::Model.stubs(:hash).returns({'class' => { 'one' => 'Class', 'other' => 'Classes' }})
  end

  it 'should save yaml' do 
    I18n::Tasks::Ar::Generate.model('en')
    File.exist?("#{Rails.root}/config/locales/activerecord.models.en.yml").must_equal true
  end

  it 'should create multiple localse' do 
    I18n::Tasks::Ar::Config.locales = ['en', 'cs']
    I18n::Tasks::Ar::Generate.expects(:model).twice
    I18n::Tasks::Ar::Generate.models
  end
end