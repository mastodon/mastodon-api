require 'mastodon/rest/utils'

module Mastodon
  module REST
    module DomainBlocks
      include Mastodon::REST::Utils

      # Get a list of blocked domains
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :min_id [Integer]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<String>]
      def domain_blocks(options = {})
        perform_request_with_collection('/api/v1/domain_blocks', options, String)
      end

      # Block a domain
      # @param domain [String]
      def block_domain(domain)
        perform_request(:post, '/api/v1/domain_blocks', domain: domain)
      end

      # Unblock a domain
      # @param domain [String]
      def unblock_domain(domain)
        perform_request(:delete, '/api/v1/domain_blocks', domain: domain)
      end
    end
  end
end
