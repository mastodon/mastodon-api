require 'mastodon/rest/utils'
require 'mastodon/account'

module Mastodon
  module REST
    module Accounts
      include Mastodon::REST::Utils

      # Retrieve account of authenticated user
      # @return [Mastodon::Account]
      def verify_credentials
        perform_request_with_object(:get, '/api/v1/accounts/verify_credentials', {}, Mastodon::Account)
      end

      # Retrieve account
      # @param id [Integer]
      # @return [Mastodon::Account]
      def account(id)
        perform_request_with_object(:get, "/api/v1/accounts/#{id}", {}, Mastodon::Account)
      end
    end
  end
end
