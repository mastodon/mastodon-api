require 'mastodon/rest/utils'

module Mastodon
  module REST
    module Reports
      include Mastodon::REST::Utils

      # Create a report
      # @param account_id [Integer]
      # @param params [Hash]
      # @option params :status_ids [Array<Integer>] Statuses to be included in the report
      # @option params :comment [String] Description of the report
      # @option params :forward [Boolean] Whether to forward a copy of the report to the origin of the account
      def create_report(account_id, params = {})
        params[:'status_ids[]'] = params.delete(:status_ids) if params.key?(:status_ids)
        perform_request(:post, '/api/v1/reports', { account_id: }.merge(params))
      end
    end
  end
end
