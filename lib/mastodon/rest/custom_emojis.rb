require 'mastodon/rest/utils'
require 'mastodon/emoji'

module Mastodon
  module REST
    module CustomEmojis
      include Mastodon::REST::Utils

      # Get a list of custom emojis on the server
      # @return [Mastodon::Collection<Mastodon::Emoji>]
      def custom_emojis
        perform_request_with_collection('/api/v1/custom_emojis', {}, Mastodon::Emoji)
      end
    end
  end
end
