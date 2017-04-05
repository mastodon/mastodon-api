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
      # @return [Mastodon::Results] If q is a URL, Mastodon will
      #   attempt to fetch the provided account or status. Otherwise, it
      #   will do a local account and hashtag search.
      def search(query, options = {})
        opts = {
          q: query,
        }.merge(options)

        perform_request_with_object(:get, '/api/v1/search', opts, Mastodon::Results)
      end
    end
  end
end
