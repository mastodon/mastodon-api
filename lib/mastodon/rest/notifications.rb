require 'mastodon/rest/utils'
require 'mastodon/notification'

module Mastodon
  module REST
    module Notifications
      include Mastodon::REST::Utils

      # Get a list of notifications for the authenticated user
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :min_id [Integer]
      # @option options :limit [Integer]
      # @option options :exclude_types [Array<String>]
      # @return [Mastodon::Collection<Mastodon::Notification>]
      def notifications(options = {})
        options[:'exclude_types[]'] = options.delete(:exclude_types) if options.key?(:exclude_types)
        perform_request_with_collection(:get, '/api/v1/notifications', options, Mastodon::Notification)
      end

      # Dismiss a notification
      # @param id [Integer]
      def dismiss_notification(id)
        perform_request(:post, "/api/v1/notifications/#{id}/dismiss")
      end

      # Clear all notifications
      def clear_notifications
        perform_request(:post, '/api/v1/notifications/clear')
      end
    end
  end
end
