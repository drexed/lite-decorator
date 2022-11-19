# frozen_string_literal: true

require "delegate" unless defined?(SimpleDelegator)

module Lite
  module Decorator
    class Base < SimpleDelegator

      class << self

        def decorate(object)
          return new(object) unless object.respond_to?(:each)

          object.map { |obj| new(obj) }
        end

      end

      def class
        if object.class.respond_to?(:table_name)
          object.class
        else
          super
        end
      end

      def object
        __getobj__
      end

      def to_model
        if object.respond_to?(:to_model)
          super
        else
          object
        end
      end

    end
  end
end
