require 'mastodon/rest/utils'
require 'mastodon/featured_tag'
require 'mastodon/hashtag'

module Mastodon
  module REST
    module FeaturedTags
      include Mastodon::REST::Utils

      # View featured tags for the current user
      # @return [Mastodon::Collection<Mastodon::FeaturedTag>]
      def featured_tags
        perform_request_with_collection(:get, '/api/v1/featured_tags', {}, Mastodon::FeaturedTag)
      end

      # Feature a tag
      # @param name [String]
      # @return [Mastodon::FeaturedTag]
      def feature_tag(name)
        perform_request_with_object(:post, '/api/v1/featured_tags', {name: name}, Mastodon::FeaturedTag)
      end

      # Unfeature a tag
      # @param tag_id [Integer]
      def unfeature_tag(tag_id)
        perform_request(:delete, "/api/v1/featured_tags/#{tag_id}")
      end

      # Get suggested tags to feature
      # @return [Mastodon::Collection<Mastodon::Hashtag>]
      def suggested_tags_to_feature
        perform_request_with_collection(:get, '/api/v1/featured_tags/suggestions', {}, Mastodon::Hashtag)
      end
    end
  end
end
