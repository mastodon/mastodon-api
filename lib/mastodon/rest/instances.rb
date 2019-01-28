require 'mastodon/rest/utils'
require 'mastodon/instance'

module Mastodon
  module REST
    module Instances
      include Mastodon::REST::Utils

      # Retrieve the current instance. Does not require authentication
      # @return [Mastodon::Instance]
      def instance
        perform_request_with_object(:get, '/api/v1/instance', {}, Mastodon::Instance)
      end

      # Retrieve activity statistics for the current instance. Does not require authentication
      # @return [Mastodon::Collection<Hash>]
      def activity
        perform_request_with_collection(:get, '/api/v1/instance/activity', {}, Hash)
      end

      # Retrieve domains of instances known to the current instance. Does not require authentication
      # @return [Mastodon::Collection<String>]
      def peers
        perform_request_with_collection(:get, '/api/v1/instance/peers', {}, String)
      end
    end
  end
end
