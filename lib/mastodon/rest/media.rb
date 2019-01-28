require 'mastodon/rest/utils'
require 'mastodon/media'

module Mastodon
  module REST
    module Media
      include Mastodon::REST::Utils

      # Upload a media file
      # @param file [File, StringIO, HTTP::FormData::File]
      # @param params [Hash]
      # @option params :description [String] Alternative text
      # @option params :focus [String] Two floating points, comma-delimited
      # @return [Mastodon::Media]
      def upload_media(file, params = {})
        file = file.is_a?(HTTP::FormData::File) ? file : HTTP::FormData::File.new(file)
        perform_request_with_object(:post, '/api/v1/media', { file: file }.merge(params), Mastodon::Media)
      end

      # Update a media description, can only be updated while it's not associated to a status
      # @param id [Integer]
      # @param params [Hash]
      # @option params :description [String] Alternative text
      # @option params :focus [String] Two floating points, comma-delimited
      # @return [Mastodon::Media]
      def update_media(id, params)
        perform_request_with_object(:put, "/api/v1/media/#{media_id}", params, Mastodon::Media)
      end
    end
  end
end
