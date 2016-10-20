require 'mastodon/rest/utils'
require 'mastodon/status'

module Mastodon
  module REST
    module Timelines
      include Mastodon::REST::Utils

      # Retrieve statuses from the home timeline
      # @return [Mastodon::Collection<Mastodon::Status>]
      def home_timeline
        perform_request_with_collection(:get, '/api/v1/statuses/home', {}, Mastodon::Status)
      end

      # Retrieve statuses from the mentions timeline
      # @return [Mastodon::Collection<Mastodon::Status>]
      def mentions_timeline
        perform_request_with_collection(:get, '/api/v1/statuses/mentions', {}, Mastodon::Status)
      end

      # Retrieve statuses from the public timeline
      # @return [Mastodon::Collection<Mastodon::Status>]
      def public_timeline
        perform_request_with_collection(:get, '/api/v1/statuses/public', {}, Mastodon::Status)
      end
    end
  end
end
