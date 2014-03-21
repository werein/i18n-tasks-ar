$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'i18n/tasks/ar/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'i18n-tasks-ar'
  s.version     = I18n::Tasks::Ar::VERSION
  s.authors     = ['TODO: Your name']
  s.email       = ['TODO: Your email']
  s.homepage    = 'TODO'
  s.summary     = 'TODO: Summary of I18nDbTasks.'
  s.description = 'TODO: Description of I18nDbTasks.'

  s.files = Dir['{app,config,db,lib}/**/*', 'License.txt', 'Rakefile', 'Readme.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.0'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'tuberack'
end
