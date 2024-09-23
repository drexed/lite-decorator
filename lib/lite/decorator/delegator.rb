# frozen_string_literal: true

module Lite
  module Decorator
    module Delegator

      def self.included(base)
        base.include Inference
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

        respond_to_method_cache[method_name] = decorator&.public_methods&.include?(method_name)
      end

      def respond_to_missing?(method_name, include_private = false)
        respond_to_method?(method_name) || super
      end

    end
  end
end
