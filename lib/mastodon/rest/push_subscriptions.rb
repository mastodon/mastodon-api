require 'mastodon/rest/utils'
require 'mastodon/push_subscription'

module Mastodon
  module REST
    module PushSubscriptions
      include Mastodon::REST::Utils

      # Subscribe to push notifications
      # @param subscription [Hash]
      # @option subscription :endpoint [String]
      # @option subscription :keys [Hash]
      # @option subscription :keys :p256dh [String]
      # @option subscription :keys :auth [String]
      # @param data [Hash]
      # @option data :alerts [Hash]
      # @option data :alerts :follow [Boolean]
      # @option data :alerts :favourite [Boolean]
      # @option data :alerts :reblog [Boolean]
      # @option data :alerts :mention [Boolean]
      # @option data :alerts :poll [Boolean]
      # @return [Mastodon::PushSubscription]
      def subscribe(subscription = {}, data = {})
        perform_request_with_object(:post, '/api/v1/push/subscription', { 'subscription': subscription, 'data': data }, Mastodon::PushSubscription)
      end

      # Get the current subscription for the access token
      # @return [Mastodon::PushSubscription]
      def subscription
        perform_request_with_object(:get, '/api/v1/push/subscription', {}, Mastodon::PushSubscription)
      end

      # Update the current subscription
      # @return [Mastodon::PushSubscription]
      def change_subscription(data = {})
        perform_request_with_object(:put, '/api/v1/push/subscription', { 'data': data }, Mastodon::PushSubscription)
      end

      # Removes the current Web Push API subscription
      def remove_subscription
        perform_request(:delete, '/api/v1/push/subscription', {})
      end
    end
  end
end
