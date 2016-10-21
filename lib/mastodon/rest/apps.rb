require 'mastodon/rest/utils'
require 'mastodon/app'

module Mastodon
  module REST
    module Apps
      include Mastodon::REST::Utils

      # Register a new OAuth client app on the target instance
      # @param name [String]
      # @param redirect_uri [String]
      # @return [Mastodon::App]
      def create_app(name, redirect_uri)
        perform_request_with_object(:post, '/api/v1/apps', { client_name: name, redirect_uris: redirect_uri }, Mastodon::App)
      end
    end
  end
end
