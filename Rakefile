# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :parsers do
  desc "get new book for packtub site"
  task :add_new_book => :environment do
    ParseBookService.perform
  end
end