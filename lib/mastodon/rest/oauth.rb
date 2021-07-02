require 'mastodon/rest/utils'
require 'mastodon/access_token'

module Mastodon
  module REST
    module OAuth
      include Mastodon::REST::Utils

      # Get an access token
      # @param options [Hash]
      # @option options :client_id [String]
      # @option options :client_secret [String]
      # @option options :redirect_uri [String]
      # @option options :scope [String]
      # @option options :code [String]
      # @option options :grant_type [String]
      # @return [Mastodon::Collection<Mastodon::AccessToken>]
      def obtain_token(options = {})
        perform_request_with_object(:post, '/api/v1/oauth/token', options, Mastodon::AccessToken)
      end

      # Revoke a token
      # @param options [Hash]
      # @option options :client_id [String]
      # @option options :client_secret [String]
      # @option options :token [String]
      # @option options :scope [String]
      # @option options :code [String]
      # @option options :grant_type [String]
      def revoke_token(options = {})
        perform_request(:post, '/api/v1/oauth/revoke', options)
      end
    end
  end
end
