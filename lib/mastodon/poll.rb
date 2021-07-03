module Mastodon
  class Poll < Mastodon::Base
    # @!attribute [r] id
    #   @return [String]
    # @!attribute [r] expires_at
    #   @return [String]
    # @!attribute [r] votes_count
    #   @return [Integer]
    # @!attribute [r] voters_count
    #   @return [Integer]
    # @!attribute [r] expired?
    #   @return [Boolean]
    # @!attribute [r] voted?
    #   @return [Boolean]
    # @!attribute [r] multiple?
    #   @return [Boolean]
    # @!attribute [r] own_votes
    #   @return [Array<Integer>]
    # @!attribute [r] options
    #   @return [Array<Hash>]
    # @!attribute [r] emojis
    #   @return [Mastodon::Collection<Mastodon::Emoji>]

    normal_attr_reader :id,
                       :expires_at,
                       :votes_count,
                       :voters_count,
                       :own_votes,
                       :options

    predicate_attr_reader :voted,
                          :multiple,
                          :expired

    collection_attr_reader :emojis, Mastodon::Emoji

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end
  end
end
