require 'mastodon/rest/utils'
require 'mastodon/relationship'
require 'mastodon/status'

module Mastodon
  module REST
    module Relationships
      include Mastodon::REST::Utils

      # Get the relationships of authenticated user towards given other users
      # @param ids [Integer]
      # @return [Mastodon::Collection<Mastodon::Relationship>]
      def relationships(*ids)
        perform_request_with_collection(:get, '/api/v1/accounts/relationships', { 'id[]': ids }, Mastodon::Relationship)
      end

      # Get a list of pending follow requests
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :min_id [Integer]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def follow_requests(options = {})
        perform_request_with_collection(:get, '/api/v1/follow_requests', options, Mastodon::Account)
      end

      # Authorize a follow request
      # @param id [Integer]
      def authorize_follow_request(id)
        perform_request(:post, "/api/v1/follow_requests/#{id}/authorize")
      end

      # Reject a follow request
      # @param id [Integer]
      def reject_follow_request(id)
        perform_request(:post, "/api/v1/follow_requests/#{id}/reject")
      end

      # Follow a user
      # @param id [Integer]
      # @return [Mastodon::Relationship]
      def follow(id)
        perform_request_with_object(:post, "/api/v1/accounts/#{id}/follow", {}, Mastodon::Relationship)
      end

      # Follow a remote user
      # @param uri [String] username@domain of the person you want to follow
      # @return [Mastodon::Account]
      def remote_follow(uri)
        perform_request_with_object(:post, '/api/v1/follows', { uri: }, Mastodon::Account)
      end

      # Unfollow a user
      # @param id [Integer]
      # @return [Mastodon::Relationship]
      def unfollow(id)
        perform_request_with_object(:post, "/api/v1/accounts/#{id}/unfollow", {}, Mastodon::Relationship)
      end

      # Get a list of blocked accounts
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :min_id [Integer]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def blocks(options = {})
        perform_request_with_collection(:get, '/api/v1/blocks', options, Mastodon::Account)
      end

      # Block a user
      # @param id [Integer]
      # @return [Mastodon::Relationship]
      def block(id)
        perform_request_with_object(:post, "/api/v1/accounts/#{id}/block", {}, Mastodon::Relationship)
      end

      # Unblock a user
      # @param id [Integer]
      # @return [Mastodon::Relationship]
      def unblock(id)
        perform_request_with_object(:post, "/api/v1/accounts/#{id}/unblock", {}, Mastodon::Relationship)
      end

      # Get a list of muted accounts
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :min_id [Integer]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def mutes(options = {})
        perform_request_with_collection(:get, '/api/v1/mutes', options, Mastodon::Account)
      end

      # Mute a user
      # @param id [Integer]
      # @return [Mastodon::Relationship]
      def mute(id)
        perform_request_with_object(:post, "/api/v1/accounts/#{id}/mute", {}, Mastodon::Relationship)
      end

      # Unmute a user
      # @param id [Integer]
      # @return [Mastodon::Relationship]
      def unmute(id)
        perform_request_with_object(:post, "/api/v1/accounts/#{id}/unmute", {}, Mastodon::Relationship)
      end

      # Mute notifications for a status
      # @param id [Integer]
      # @return [Mastodon::Status]
      def mute_status(id)
        perform_request_with_object(:post, "/api/v1/statuses/#{id}/mute", {}, Mastodon::Status)
      end

      # Unmute notifications for a status
      # @param id [Integer]
      # @return [Mastodon::Status]
      def unmute_status(id)
        perform_request_with_object(:post, "/api/v1/statuses/#{id}/unmute", {}, Mastodon::Status)
      end
    end
  end
end
