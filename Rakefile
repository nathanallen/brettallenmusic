# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

namespace :db do
  task :reseed => ['db:drop', 'db:create', 'db:migrate', 'db:seed']
end

Brettallenmusic::Application.load_tasks
