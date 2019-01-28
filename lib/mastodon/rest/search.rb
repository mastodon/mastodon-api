require 'mastodon/rest/utils'
require 'mastodon/status'

module Mastodon
  module REST
    module Search
      include Mastodon::REST::Utils

      # Search for content
      # @param options [Hash]
      # @option options :q [String] The search query
      # @option options :resolve [Boolean] Whether to resolve non-local accounts
      # @option options :limit [Integer]
      # @return [Mastodon::Results]
      def search(query, options = {})
        perform_request_with_object(:get, '/api/v2/search', { q: query }.merge(options), Mastodon::Results)
      end
    end
  end
end
