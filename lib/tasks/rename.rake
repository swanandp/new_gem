require 'new_gem/task_helper'

desc 'Sets up the environment for a task'
task :env do
  include(NewGem::TaskHelper)
end

def say(something)
  puts something unless ENV['quiet'] == 'true'
end

def sanitize_dir_name(name)
  (name || name.to_s).gsub(/[^a-z]+/i, '_').
      gsub(/^_+/, '').
      gsub(/_+$/, '')
end

desc 'Rename this gem from new_gem to something_else'
task :rename, [:old_name, :new_name] => :env do |_, args|
  apply_arguments(args)
  new_name = sanitize_dir_name(@new_name)
  old_name = sanitize_dir_name(@old_name)
  return unless old_name.length > 0 && new_name.length > 0
  say "Renaming everything from #{old_name} to '#{new_name}'"
  # TODO
  # sh %{ find . -type f -exec rename 's/#{old_name}/#{new_name}/' '{}' \\;}
  say 'Done.'
end
