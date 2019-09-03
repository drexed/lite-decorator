# frozen_string_literal: true

require 'rails/generators'

module Lite
  module Decorator
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      def copy_application_query_file
        copy_file('install.rb', 'app/decorators/application_decorator.rb')
      end

    end
  end
end
