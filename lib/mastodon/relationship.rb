module Mastodon
  class Relationship < Mastodon::Base
    # @!attribute [r] id
      #   @return [Integer] Account ID
      # @!attribute [r] following?
      #   @return [Boolean]
      # @!attribute [r] followed_by?
      #   @return [Boolean]
      # @!attribute [r] blocking?
      #   @return [Boolean]

    normal_attr_reader :id
    predicate_attr_reader :following, :followed_by, :blocking

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end
  end
end
