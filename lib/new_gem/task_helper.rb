module NewGem
  module TaskHelper
    module ClassMethods
      def apply_arguments(args)
        args.each do |name, value|
          instance_variable_set "@#{name}", value
        end
      end
    end

    module Functional
      def file_matching_new_gem_in_cwd
        curry_left(files_with_new_game_in_name, Dir['*'])
      end

      def files_with_new_game_in_name
        curry_right(files_matching_name, 'new_gem')
      end

      def files_matching_name
        ->(filenames, name) {
          filenames.select { |filename| filename.include?(name) }
        }
      end

      def curry_left(proc, *args)
        ->(*last_arg) {
          proc.call(*(args + Array(last_arg)))
        }
      end

      def curry_right(proc, *args)
        ->(*last_arg) {
          proc.call(*(Array(last_arg) + args))
        }
      end

      def compose(*procs)
        ->(*args) {
          procs.reverse_each.reduce(args) { |memo, proc|
            [proc.call(*memo)]
          }
        }
      end
    end

    def self.included(receiver)
      receiver.send :include, ClassMethods
      receiver.send :include, Functional
    end
  end
end
