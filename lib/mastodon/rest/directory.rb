require 'mastodon/rest/utils'
require 'mastodon/account'

module Mastodon
  module REST
    module Directory
      include Mastodon::REST::Utils

      # List accounts visible in the directory
      # @param options [Hash]
      # @option options :offset [String]
      # @option options :limit [String]
      # @option options :order [String]
      # @option options :local [Boolean]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def view_directory(options = {})
        perform_request_with_collection(:get, '/api/v1/directory', options, Mastodon::Account)
      end
    end
  end
end
