begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end


APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'
Bundler::GemHelper.install_tasks

load "rspec/rails/tasks/rspec.rake"

desc "Run the javascript specs"
task :teaspoon => "app:teaspoon"

# Default
Rake::Task["default"].prerequisites.clear
Rake::Task["default"].clear

task :default => [:test]

task :test => [:spec, :teaspoon]
