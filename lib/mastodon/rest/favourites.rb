require 'mastodon/rest/utils'
require 'mastodon/status'

module Mastodon
  module REST
    module Favourites
      include Mastodon::REST::Utils

      # Get a list of statuses that the current user has favourited
      # @param options [Hash]
      # @option options :limit [String]
      # @option options :min_id [Integer]
      # @option options :max_id [Integer]
      # @return [Mastodon::Collection<Mastodon::Status>]
      def favourites(options = {})
        perform_request_with_collection(:get, "/api/v1/favourites", options, Mastodon::Status)
      end
    end
  end
end
