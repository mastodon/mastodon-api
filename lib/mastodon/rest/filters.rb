require 'mastodon/rest/utils'
require 'mastodon/filter'

module Mastodon
  module REST
    module Filters
      include Mastodon::REST::Utils

      # Get a list of filters
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :min_id [Integer]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Filter>]
      def filters(options = {})
        perform_request_with_collection('/api/v1/filters', options, Mastodon::Filter)
      end

      # Retrieve a filter
      # @param id [Integer]
      # @return [Mastodon::Filter]
      def filter(id)
        perform_request_with_object(:put, "/api/v1/filters/#{id}", {}, Mastodon::Filter)
      end

      # Create a filter
      # @param params [Hash]
      # @option params :phrase [String]
      # @option params :context [Array<String>]
      # @option params :irreversible [Boolean]
      # @option params :whole_word [Boolean]
      # @option params :expires_in [Integer]
      # @return [Mastodon::Filter]
      def create_filter(params = {})
        params[:'context[]'] = params.delete(:context) if params.key?(:context)
        perform_request_with_object(:post, '/api/v1/filters', params, Mastodon::Filter)
      end

      # Update a filter
      # @param id [Integer]
      # @param params [Hash]
      # @option params :phrase [String]
      # @option params :context [Array<String>]
      # @option params :irreversible [Boolean]
      # @option params :whole_word [Boolean]
      # @option params :expires_in [Integer]
      # @return [Mastodon::Filter]
      def update_filter(id, params = {})
        params[:'context[]'] = params.delete(:context) if params.key?(:context)
        perform_request_with_object(:put, "/api/v1/filters/#{id}", params, Mastodon::Filter)
      end

      # Delete a filter
      # @param id [Integer]
      def delete_filter(id)
        perform_request(:delete, "/api/v1/filters/#{id}")
      end
    end
  end
end
