require 'mastodon/rest/utils'
require 'mastodon/status'

module Mastodon
  module REST
    module Statuses
      include Mastodon::REST::Utils

      # Create new status
      # @param text [String]
      # @param in_reply_to_id [Integer]
      # @param media_ids [Array<Integer>]
      # @param visibility [String]
      # @return [Mastodon::Status]
      def create_status(text, in_reply_to_id = nil, media_ids = [], visibility = nil)
        params = {
          status: text,
          in_reply_to_id: in_reply_to_id,
          'media_ids[]' => media_ids,
          visibility: visibility,
        }
        perform_request_with_object(:post, '/api/v1/statuses', params, Mastodon::Status)
      end

      # Retrieve status
      # @param id [Integer]
      # @return [Mastodon::Status]
      def status(id)
        perform_request_with_object(:get, "/api/v1/statuses/#{id}", {}, Mastodon::Status)
      end

      # Destroy status
      # @param id [Integer]
      # @return [Boolean]
      def destroy_status(id)
        !perform_request(:delete, "/api/v1/statuses/#{id}").nil?
      end

      # Reblog a status
      # @param id [Integer]
      # @return [Mastodon::Status]
      def reblog(id)
        perform_request_with_object(:post, "/api/v1/statuses/#{id}/reblog", {}, Mastodon::Status)
      end

      # Undo a reblog of a status
      # @param id [Integer]
      # @return [Mastodon::Status]
      def unreblog(id)
        perform_request_with_object(:post, "/api/v1/statuses/#{id}/unreblog", {}, Mastodon::Status)
      end

      # Favourite a status
      # @param id [Integer]
      # @return [Mastodon::Status]
      def favourite(id)
        perform_request_with_object(:post, "/api/v1/statuses/#{id}/favourite", {}, Mastodon::Status)
      end

      # Undo a favourite of a status
      # @param id [Integer]
      # @return [Mastodon::Status]
      def unfavourite(id)
        perform_request_with_object(:post, "/api/v1/statuses/#{id}/unfavourite", {}, Mastodon::Status)
      end

      # Get a list of accounts that reblogged a toot
      # @param id [Integer]
      # @param options [Hash]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def reblogged_by(id, options = {})
        perform_request_with_collection(:get, "/api/v1/statuses/#{id}/reblogged_by", options, Mastodon::Account)
      end

      # Get a list of accounts that favourited a toot
      # @param id [Integer]
      # @param options [Hash]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def favourited_by(id, options = {})
        perform_request_with_collection(:get, "/api/v1/statuses/#{id}/favourited_by", options, Mastodon::Account)
      end

      # Get a list of statuses by a user
      # @param account_id [Integer]
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Status>]
      def statuses(account_id, options = {})
        perform_request_with_collection(:get, "/api/v1/accounts/#{account_id}/statuses", options, Mastodon::Status)
      end
    end
  end
end
