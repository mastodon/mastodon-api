module Mastodon
  class AccessToken < Mastodon::Base
    # @!attribute [r] access_token
    #   @return [String]
    # @!attribute [r] token_type
    #   @return [String]
    # @!attribute [r] scope
    #   @return [String]
    # @!attribute [r] created_at
    #   @return [String]
    normal_attr_reader :access_token,
                       :token_type,
                       :scope,
                       :created_at

    def initialize(attributes = {})
      attributes.fetch('access_token')
      super
    end
  end
end
