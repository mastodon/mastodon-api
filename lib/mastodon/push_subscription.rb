module Mastodon
  class PushSubscription < Mastodon::Base
    # @!attribute [r] id
    #   @return [String]
    # @!attribute [r] endpoint
    #   @return [String]
    # @!attribute [r] server_key
    #   @return [String]
    # @!attribute [r] alerts
    #   @return [Hash]

    normal_attr_reader :id,
                       :endpoint,
                       :server_key,
                       :alerts

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end
  end
end
