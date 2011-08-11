require 'bundler'
Bundler::GemHelper.install_tasks
Bundler.setup

require 'rspec/core/rake_task'

desc 'Run all tests'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w(--color --format documentation)
  t.verbose    = false
end

desc "Open an irb session preloaded with the new_gem"
task :console do
  sh 'irb -rubygems -I lib -r new_gem.rb'
end

task :default => :spec
