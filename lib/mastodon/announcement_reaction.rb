module Mastodon
  class AnnouncementReaction < Mastodon::Base
    # @!attribute [r] name
    #   @return [String]
    # @!attribute [r] count
    #   @return [Integer]
    # @!attribute [r] me?
    #   @return [Boolean]
    # @!attribute [r] url
    #   @return [String]
    # @!attribute [r] static_url
    #   @return [String]

    normal_attr_reader :name,
                       :count,
                       :url,
                       :static_url

    predicate_attr_reader :me

    def initialize(attributes = {})
      attributes.fetch('name')
      super
    end
  end
end
