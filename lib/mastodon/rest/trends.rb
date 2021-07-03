require 'mastodon/rest/utils'
require 'mastodon/hashtag'

module Mastodon
  module REST
    module Trends
      include Mastodon::REST::Utils

      # Get trending tags within the past week
      # @param limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Hashtag>]
      def trending_tags(limit = 10)
        perform_request_with_collection(:get, '/api/v1/trends', { 'limit': limit }, Mastodon::Hashtag)
      end
    end
  end
end
