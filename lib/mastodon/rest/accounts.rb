require 'mastodon/rest/utils'
require 'mastodon/account'
require 'mastodon/access_token'

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
      # @param params [Hash]
      # @option params :display_name [String] The name to display in the user's profile
      # @option params :note [String] A new biography for the user
      # @option params :avatar [File, StringIO, HTTP::FormData::File]
      # @option params :header [File, StringIO, HTTP::FormData::File]
      # @return [Mastodon::Account]
      def update_credentials(params = {})
        %i(avatar header).each do |key|
          next unless params.key?(key)
          params[key] = params[key].is_a?(HTTP::FormData::File) ? params[key] : HTTP::FormData::File.new(params[key])
        end

        perform_request_with_object(:patch, '/api/v1/accounts/update_credentials', params, Mastodon::Account)
      end

      # Retrieve account
      # @param id [Integer]
      # @return [Mastodon::Account]
      def account(id)
        perform_request_with_object(:get, "/api/v1/accounts/#{id}", {}, Mastodon::Account)
      end

      # Get a list of followers
      # @param id [Integer]
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :min_id [Integer]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def followers(id, options = {})
        perform_request_with_collection(:get, "/api/v1/accounts/#{id}/followers", options, Mastodon::Account)
      end

      # Get a list of followed accounts
      # @param id [Integer]
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :min_id [Integer]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def following(id, options = {})
        perform_request_with_collection(:get, "/api/v1/accounts/#{id}/following", options, Mastodon::Account)
      end

      # Sign up (requires authentication with client credentials)
      # @param params [Hash]
      # @option params :username [String]
      # @option params :email [String]
      # @option params :password [String]
      # @option params :agreement [Boolean]
      # @option params :locale [String]
      # @return [Mastodon::AccessToken]
      def create_account(params = {})
        perform_request_with_object(:post, '/api/v1/accounts', params, Mastodon::AccessToken)
      end

      # Search accounts
      # @param query [String]
      # @param params [Hash]
      # @option params :limit [Integer]
      # @option params :resolve [Boolean] Whether to attempt resolving unknown remote accounts
      # @option params :following [Boolean] Only return matches the authenticated user follows
      # @return [Mastodon::Collection<Mastodon::Account>]
      def search_accounts(query, params = {})
        perform_request_with_collection(:get, '/api/v1/accounts/search', { q: query }.merge(params), Mastodon::Account)
      end
    end
  end
end
