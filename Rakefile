require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new

task :karma do
  sh 'npm install'
  sh 'npm test'
end

task :test => [:spec, :karma]

task :default => [:test]
