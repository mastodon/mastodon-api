require 'mastodon/rest/utils'
require 'mastodon/scheduled_status'

module Mastodon
  module REST
    module ScheduledStatuses
      include Mastodon::REST::Utils

      # Get a list of scheduled statuses
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :min_id [Integer]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::ScheduledStatus>]
      def scheduled_statuses(options = {})
        perform_request_with_collection(:get, '/api/v1/scheduled_statuses', options, Mastodon::ScheduledStatus)
      end

      # Retrieve a scheduled status
      # @param id [Integer]
      # @return [Mastodon::ScheduledStatus]
      def scheduled_status(id)
        perform_request_with_object(:get, "/api/v1/scheduled_statuses/#{id}", {}, Mastodon::ScheduledStatus)
      end

      # Update a scheduled status
      # @param id [Integer]
      # @param params [Hash]
      # @option params :scheduled_at [String]
      # @return [Mastodon::ScheduledStatus]
      def update_scheduled_status(id, params = {})
        perform_request_with_object(:put, "/api/v1/scheduled_statuses/#{id}", params, Mastodon::ScheduledStatus)
      end

      # Cancel a scheduled status
      # @param id [Integer]
      def delete_scheduled_status(id)
        perform_request(:delete, "/api/v1/scheduled_statuses/#{id}")
      end
    end
  end
end
