# frozen_string_literal: true

module Lite
  module Decorator
    module Record

      def decorator_class
        return @decorator_class if defined?(@decorator_class)

        @decorator_class = "#{self.class.name}Decorator".safe_constantize
      end

      def decorator
        @decorator ||= decorator_class&.new(self)
      end

      private

      def method_missing(method_name, *args, **kwargs, &)
        if respond_to_method?(method_name)
          decorator.send(method_name, *args, **kwargs, &)
        else
          super
        end
      end

      def respond_to_method_cache
        @respond_to_method_cache ||= {}
      end

      def respond_to_method?(method_name)
        return respond_to_method_cache[method_name] if respond_to_method_cache.key?(method_name)

        respond_to_method_cache[method_name] = decorator.present? && decorator.public_methods.include?(method_name)
      end

      def respond_to_missing?(method_name, include_private = false)
        respond_to_method?(method_name) || super
      end

    end
  end
end
