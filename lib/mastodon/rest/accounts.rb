require 'mastodon/rest/utils'
require 'mastodon/account'

module Mastodon
  module REST
    module Accounts
      include Mastodon::REST::Utils

      # Retrieve account of authenticated user
      # @return [Mastodon::Account]
      def verify_credentials
        perform_request_with_object(:get, '/api/v1/accounts/verify_credentials', {}, Mastodon::Account)
      end

      # Update authenticated account attributes
      # @param options [Hash]
      # @option options display_name [String] The name to display in the user's profile
      # @option options note [String] A new biography for the user
      # @option options avatar [String] A base64 encoded image to display as the user's avatar
      # @option options header [String] A base64 encoded image to display as the user's header image
      # @return [Mastodon::Account]
      def update_credentials(opts = {})
        perform_request_with_object(:patch, '/api/v1/accounts/update_credentials', opts, Mastodon::Account)
      end

      # Retrieve account
      # @param id [Integer]
      # @return [Mastodon::Account]
      def account(id)
        perform_request_with_object(:get, "/api/v1/accounts/#{id}", {}, Mastodon::Account)
      end

      # Get a list of followers
      # @param id [Integer]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def followers(id)
        perform_request_with_collection(:get, "/api/v1/accounts/#{id}/followers", {}, Mastodon::Account)
      end

      # Get a list of followed accounts
      # @param id [Integer]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def following(id)
        perform_request_with_collection(:get, "/api/v1/accounts/#{id}/following", {}, Mastodon::Account)
      end

      # Follow a remote user
      # @param uri [String] The URI of the remote user, in the format of username@domain
      # @return [Mastodon::Account]
      def follow_by_uri(uri)
        perform_request_with_object(:post, '/api/v1/follows', { uri: uri }, Mastodon::Account)
      end

      # Getting an account's status
      # @param id [Integer]
      # @param options [Hash]
      # @options max_id [Integer] Get a list of statuses with ID less than this value
      # @optoins since_id [Integer] Get a list of statuses with ID greater than this value
      # @options limit [Integer] Maximum number of statuses to get (Default 20, Max 40)
      # @return [Mastodon::Collection<Mastodon::Status>]
      def statuses(id, opts = {})
        perform_request_with_collection(:get, "/api/v1/accounts/#{id}/statuses", opts, Mastodon::Status)
      end
    end
  end
end
