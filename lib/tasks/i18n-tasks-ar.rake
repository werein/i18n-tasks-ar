# desc "Explaining what the task does"
# task :i18n_db_tasks do
#   # Task goes here
# end

namespace :i18n_tasks_ar do
  desc 'Rebuild entire model translation file'
  task :rebuild_models do
    I18n::Tasks::Ar::Generate.models
  end
end