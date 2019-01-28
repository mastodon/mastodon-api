require 'mastodon/rest/utils'
require 'mastodon/conversation'

module Mastodon
  module REST
    module Conversations
      include Mastodon::REST::Utils

      # Get a list of conversations
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :min_id [Integer]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Conversation>]
      def conversations(options = {})
        perform_request_with_collection(:get, '/api/v1/conversations', options, Mastodon::Conversation)
      end

      # Mark a conversation as read
      # @param id [Integer]
      # @return [Mastodon::Conversation]
      def mark_conversation_as_read(id)
        perform_request_with_object(:post, "/api/v1/conversations/#{id}/read", {}, Mastodon::Conversation)
      end

      # Delete a conversation. Does not delete statuses in the conversation
      # @param id [Integer]
      def delete_conversation(id)
        perform_request(:delete, "/api/v1/conversations/#{id}")
      end
    end
  end
end
