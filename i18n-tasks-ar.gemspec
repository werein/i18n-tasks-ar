$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'i18n/tasks/ar/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'i18n-tasks-ar'
  s.version     = I18n::Tasks::Ar::VERSION
  s.authors     = ['Jiri Kolarik']
  s.email       = ['jiri.kolarik@imin.cz']
  s.homepage    = 'http://werein.github.io/gems/i18n-tasks-ar'
  s.summary     = 'Translate your ActiveRecord models and attributes.'
  s.description = 'Tasks for generate ActiveRecord model and attributes translations'

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE.txt', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '>= 4.0'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'tuberack', '>= 1.0.2'
end
