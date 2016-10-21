require 'mastodon/rest/utils'
require 'mastodon/media'

module Mastodon
  module REST
    module Media
      include Mastodon::REST::Utils

      # Upload a media file
      # @param file [HTTP::FormData::File]
      # @return [Mastodon::Media]
      def upload_media(file)
        perform_request_with_object(:post, '/api/v1/media', { file: file }, Mastodon::Media)
      end
    end
  end
end
