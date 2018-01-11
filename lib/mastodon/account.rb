module Mastodon
  class Account < Mastodon::Base
    # @!attribute [r] id
    #   @return [String]
    # @!attribute [r] username
    #   @return [String]
    # @!attribute [r] acct
    #   @return [String]
    # @!attribute [r] display_name
    #   @return [String]
    # @!attribute [r] url
    #   @return [String]
    # @!attribute [r] avatar
    #   @return [String]
    # @!attribute [r] avatar_static
    #   @return [String]
    # @!attribute [r] header
    #   @return [String]
    # @!attribute [r] header_static
    #   @return [String]
    # @!attribute [r] note
    #   @return [String]
    # @!attribute [r] followers_count
    #   @return [Integer]
    # @!attribute [r] following_count
    #   @return [Integer]
    # @!attribute [r] statuses_count
    #   @return [Integer]
    # @!attribute [r] created_at
    #   @return [String]
    # @!attribute [r] locked?
    #   @return [Boolean]
    # @!attribute [r] moved
    #   @return [Mastodon::Account]

    normal_attr_reader :id,
                       :username,
                       :acct,
                       :display_name,
                       :created_at,
                       :url,
                       :avatar,
                       :avatar_static,
                       :header,
                       :header_static,
                       :note,
                       :followers_count,
                       :following_count,
                       :statuses_count

    predicate_attr_reader :locked

    object_attr_reader :moved, Mastodon::Account

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end
  end
end
