# frozen_string_literal: true

module Lite
  module Decorator
    module Inference

      def decorator_class
        return @decorator_class if defined?(@decorator_class)

        @decorator_class = "#{self.class.name}Decorator".safe_constantize
      end

      def decorator
        @decorator ||= decorator_class&.new(self)
      end

    end
  end
end
