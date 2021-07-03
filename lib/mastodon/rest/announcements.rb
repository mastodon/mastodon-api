require 'mastodon/rest/utils'
require 'mastodon/announcement'

module Mastodon
  module REST
    module Announcements
      include Mastodon::REST::Utils

      # See all currently active announcements set by admins for this instance
      # @param with_dismissed [Boolean]
      # @return [Mastodon::Collection<Mastodon::Announcement>]
      def announcements(with_dismissed = false)
        perform_request_with_collection(:get, '/api/v1/announcements/', { 'with_dismissed': with_dismissed }, Mastodon::Announcement)
      end

      # Dismiss an announcement
      # @param announcement_id [Integer]
      def dismiss_announcement(announcement_id)
        perform_request(:post, "/api/v1/announcements/#{announcement_id}", {})
      end

      # Dismiss an announcement
      # @param announcement_id [Integer]
      # @param emoji [String]
      def add_annoucement_reaction(announcement_id, emoji)
        perform_request(:put, "/api/v1/announcements/#{announcement_id}/reactions/#{emoji}", {})
      end

      # Dismiss an announcement
      # @param announcement_id [Integer]
      # @param emoji [String]
      def remove_annoucement_reaction(announcement_id, emoji)
        perform_request(:delete, "/api/v1/announcements/#{announcement_id}/reactions/#{emoji}", {})
      end
    end
  end
end
