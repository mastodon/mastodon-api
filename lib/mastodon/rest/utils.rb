require 'mastodon/rest/request'

module Mastodon
  module REST
    module Utils
      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      def perform_request(request_method, path, options = {})
        Mastodon::REST::Request.new(self, request_method, path, options).perform
      end

      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @param klass [Class]
      def perform_request_with_object(request_method, path, options, klass)
        response = perform_request(request_method, path, options)
        klass.new(response)
      end

      # @param request_method [Symbol]
      # @param path [String]
      # @param options [Hash]
      # @param klass [Class]
      def perform_request_with_collection(request_method, path, options, klass)
        response = perform_request(request_method, path, options)
        Mastodon::Collection.new(response, klass)
      end

      # Format an array of values into a query param
      # @param key [Symbol]
      # @param values [Enumerable]
      # @return [Array]
      def array_param(key, values)
        values.map.with_index { |value, _i| ["#{key}[]", value] }
      end
    end
  end
end
