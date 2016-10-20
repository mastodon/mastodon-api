module Mastodon
  class Account < Mastodon::Base
    # @!attribute [r] id
    #   @return [Integer]
    # @!attribute [r] username
    #   @return [String]
    # @!attribute [r] acct
    #   @return [String]
    # @!attribute [r] url
    #   @return [String]
    # @!attribute [r] avatar
    #   @return [String]
    # @!attribute [r] header
    #   @return [String]
    # @!attribute [r] note
    #   @return [String]
    # @!attribute [r] followers_count
    #   @return [Integer]
    # @!attribute [r] following_count
    #   @return [Integer]
    # @!attribute [r] statuses_count
    #   @return [Integer]

    normal_attr_reader :id, :username, :acct, :url, :avatar, :header, :note, :followers_count, :following_count, :statuses_count

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end
  end
end
