module Mastodon
  class Relationship < Mastodon::Base
    # @!attribute [r] id
    #   @return [String] Account ID
    # @!attribute [r] following?
    #   @return [Boolean]
    # @!attribute [r] followed_by?
    #   @return [Boolean]
    # @!attribute [r] blocking?
    #   @return [Boolean]
    # @!attribute [r] muting?
    #   @return [Boolean]
    # @!attribute [r] muting_notifications?
    #   @return [Boolean]
    # @!attribute [r] requested?
    #   @return [Boolean]
    # @!attribute [r] domain_blocking?
    #   @return [Boolean]

    normal_attr_reader :id

    predicate_attr_reader :following,
                          :followed_by,
                          :blocking,
                          :muting,
                          :muting_notifications,
                          :requested,
                          :domain_blocking

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end
  end
end
