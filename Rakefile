require "bundler/gem_tasks"
require "rake/testtask"
require "English"

task :default do
  $LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))
  $LOAD_PATH.unshift(File.expand_path('../test', __FILE__))
  require 'test_helper'
  require 'tests/session_test'
  require 'tests/controller_delegate_test'
  require 'tests/controller_extension_test'
  require 'tests/events_test'
end

task "webpacker:check_webpack_binstubs"
Rake::Task["webpacker:check_webpack_binstubs"].clear

namespace :example_app do
  desc "Runs yarn in test/example_app"
  task :yarn do
    sh "cd test/example_app && yarn"
  end

  desc "Runs webpack in test/example_app"
  task webpack: :yarn do
    sh "cd test/example_app && RAILS_ENV=test ./bin/webpack"
  end
end

Rake::Task["test"].enhance ["example_app:webpack"]