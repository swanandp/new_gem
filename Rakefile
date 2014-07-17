require 'bundler'
Bundler::GemHelper.install_tasks
Bundler.setup

require 'rspec/core/rake_task'
Dir.glob('lib/tasks/*.rake').each { |r| import r }

desc 'Run all tests'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w(--color --format documentation)
  t.verbose    = false
end

desc 'Open a pry session preloaded with the new_gem'
task :console do
  sh %{pry -I lib -r #{File.basename(Dir.pwd)}.rb}
end

task default: :spec
