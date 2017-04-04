require 'mastodon/rest/utils'
require 'mastodon/status'

module Mastodon
  module REST
    module Timelines
      include Mastodon::REST::Utils

      # Retrieve statuses from the home timeline
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Status>]
      def home_timeline(options = {})
        perform_request_with_collection(:get, '/api/v1/timelines/home', options, Mastodon::Status)
      end

      # Retrieve statuses from the public timeline
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Status>]
      def public_timeline(options = {})
        perform_request_with_collection(:get, '/api/v1/timelines/public', options, Mastodon::Status)
      end

      # Retrieve statuses from a hashtag
      # @param hashtag [String]
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Status>]
      def hashtag_timeline(hashtag, options = {})
        perform_request_with_collection(:get, "/api/v1/timelines/tag/#{hashtag}", options, Mastodon::Status)
      end
    end
  end
end
