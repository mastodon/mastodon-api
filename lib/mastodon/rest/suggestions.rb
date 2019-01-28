require 'mastodon/rest/utils'
require 'mastodon/account'

module Mastodon
  module REST
    module Suggestions
      include Mastodon::REST::Utils

      # Get "who to follow" suggestions for authenticated user
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :min_id [Boolean]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def suggestions(options = {})
        perform_request_with_collection(:get, '/api/v1/suggestions', options, Mastodon::Account)
      end

      # Remove a suggestion
      # @param account_id [Integer]
      def delete_suggestion(account_id)
        perform_request(:delete, "/api/v1/suggestions/#{account_id}")
      end
    end
  end
end
