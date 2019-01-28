module Mastodon
  class Filter < Mastodon::Base
    # @!attribute [r] id
    #   @return [String]
    # @!attribute [r] phrase
    #   @return [String]
    # @!attribute [r] context
    #   @return [Array<String>]
    # @!attribute [r] expires_at
    #   @return [String]
    # @!attribute [r] irreversible?
    #   @return [Boolean]
    # @!attribute [r] whole_word?
    #   @return [Boolean]

    normal_attr_reader :id,
                       :phrase,
                       :context,
                       :expires_at

    predicate_attr_reader :irreversible,
                          :whole_word

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end
  end
end
