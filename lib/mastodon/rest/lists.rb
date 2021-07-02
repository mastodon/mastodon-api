require 'mastodon/rest/utils'
require 'mastodon/list'
require 'mastodon/account'

module Mastodon
  module REST
    module Lists
      include Mastodon::REST::Utils

      # Get a list of your lists
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::List>]
      def lists(options = {})
        perform_request_with_collection(:get, '/api/v1/lists', options, Mastodon::List)
      end

      # Retrieve a list
      # @param id [Integer]
      # @return [Mastodon::List]
      def list(id)
        perform_request_with_object(:get, "/api/v1/lists/#{id}", {}, Mastodon::List)
      end

      # Create a list
      # @param params [Hash]
      # @option params :title
      # @return [Mastodon::List]
      def create_list(params = {})
        perform_request_with_object(:post, '/api/v1/lists/', params, Mastodon::List)
      end

      # Update a list
      # @param id [Integer]
      # @param params [Hash]
      # @option params :title
      # @return [Mastodon::List]
      def update_list(id, params = {})
        perform_request_with_object(:put, "/api/v1/lists/#{id}", params, Mastodon::List)
      end

      # Delete a list
      # @param id [Integer]
      def delete_list(id)
        perform_request(:delete, "/api/v1/lists/#{id}")
      end

      # Get a list of accounts on the list
      # @param id [Integer]
      # @param options [Hash]
      # @option options :max_id [Integer]
      # @option options :since_id [Integer]
      # @option options :min_id [Integer]
      # @option options :limit [Integer]
      # @return [Mastodon::Collection<Mastodon::Account>]
      def list_accounts(id, options = {})
        perform_request_with_collection(:get, "/api/v1/lists/#{id}/accounts", options, Mastodon::Account)
      end

      # Add accounts to a list
      # @param id [Integer]
      # @param account_ids [Array<Integer>]
      def add_accounts_to_list(id, account_ids = [])
        perform_request(:post, "/api/v1/lists/#{id}/accounts", { 'account_ids[]': account_ids })
      end

      # Remove accounts from list
      # @param id [Integer]
      # @param account_ids [Array<Integer>]
      def remove_accounts_from_list(id, account_ids = [])
        perform_request(:delete, "/api/v1/lists/#{id}/accounts", { 'account_ids[]': account_ids })
      end

      # Lists that you have added the given account ID to
      # @param id [Integer]
      # @return [Mastodon::Collection<Mastodon::List>]
      def lists_containing_account(account_id)
        perform_request_with_collection(:get, "/api/v1/accounts/#{account_id}/lists", {}, Mastodon::List)
      end
    end
  end
end
