require 'mastodon/rest/utils'
require 'mastodon/media'

module Mastodon
  module REST
    module Media
      include Mastodon::REST::Utils

      # Upload a media file
      # @param file [File, StringIO, HTTP::FormData::File] file to
      #   upload. Will be converted to HTTP::FormData::File before upload
      # @return [Mastodon::Media]
      def upload_media(file)
        file = file.is_a?(HTTP::FormData::File) ? file : HTTP::FormData::File.new(file)
        perform_request_with_object(:post, '/api/v1/media', { file: file }, Mastodon::Media)
      end
    end
  end
end
