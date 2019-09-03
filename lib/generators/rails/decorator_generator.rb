# frozen_string_literal: true

require 'rails/generators'

module Rails
  class DecoratorGenerator < Rails::Generators::NamedBase

    source_root File.expand_path('../templates', __FILE__)
    check_class_collision suffix: 'Decorator'

    def copy_files
      path = File.join('app', 'decorators', class_path, "#{file_name}_decorator.rb")
      empty_directory('app/decorators')
      template('decorator.rb.tt', path)
    end

    def copy_specs
      path = File.join('spec', 'decorators', class_path, "#{file_name}_decorator_spec.rb")
      empty_directory('spec/decorators')
      template('spec.rb.tt', path)
    end

    private

    def file_name
      @_file_name ||= remove_possible_suffix(super)
    end

    def remove_possible_suffix(name)
      name.sub(/_?decorator$/i, '')
    end

  end
end
