require 'mastodon/rest/utils'
require 'mastodon/account'
require 'mastodon/relationship'

module Mastodon
  module REST
    module Endorsements
      include Mastodon::REST::Utils

      # Get a list of endorsed accounts
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :min_id [Integer]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def endorsements(options = {})
        perform_request_with_collection('/api/v1/endorsements', options, Mastodon::Account)
      end

      # Endorse an account (feature on own profile)
      # @param account_id [Integer]
      # @return [Mastodon::Relationship]
      def endorse(account_id)
        perform_request_with_object(:post, "/api/v1/accounts/#{account_id}/pin", {}, Mastodon::Relationship)
      end

      # Unendorse an account (no longer feature it on own profile)
      # @param account_id [Integer]
      # @return [Mastodon::Relationship]
      def unendorse(account_id)
        perform_request_with_object(:post, "/api/v1/accounts/#{account_id}/unpin", {}, Mastodon::Relationship)
      end
    end
  end
end
