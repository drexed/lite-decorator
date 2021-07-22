# frozen_string_literal: true

require 'generators/rails/decorator_generator' if defined?(Rails::Generators)

%w[version base].each do |name|
  require "lite/decorator/#{name}"
end
