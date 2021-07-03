require 'mastodon/rest/utils'
require 'mastodon/poll'

module Mastodon
  module REST
    module Polls
      include Mastodon::REST::Utils

      # View a poll
      # @param options [Hash]
      # @option options :client_id [String]
      # @option options :client_secret [String]
      # @option options :redirect_uri [String]
      # @option options :scope [String]
      # @option options :code [String]
      # @option options :grant_type [String]
      # @return [Mastodon::Poll]
      def view_poll(poll_id)
        perform_request_with_object(:get, "/api/v1/polls/#{poll_id}", {}, Mastodon::Poll)
      end

      # Vote on a poll
      # @param poll_id [Integer]
      # @param choices [Array<Integer>]
      # @return [Mastodon::Poll]
      def vote_on_poll(poll_id, choices = [])
        perform_request_with_object(:post, "/api/v1/polls/#{poll_id}/votes", { 'choices[]': choices }, Mastodon::Poll)
      end
    end
  end
end
