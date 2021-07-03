require 'mastodon/announcement_reaction'

module Mastodon
  class Announcement < Mastodon::Base
    # @!attribute [r] id
    #   @return [String]
    # @!attribute [r] text
    #   @return [String]
    # @!attribute [r] published?
    #   @return [Boolean]
    # @!attribute [r] all_day?
    #   @return [Boolean]
    # @!attribute [r] created_at
    #   @return [String]
    # @!attribute [r] updated_at
    #   @return [String]
    # @!attribute [r] read?
    #   @return [Boolean]
    # @!attribute [r] reactions
    #   @return [Mastodon::Collection<Mastodon::AnnouncementReaction>]
    # @!attribute [r] scheduled_at
    #   @return [String]
    # @!attribute [r] starts_at
    #   @return [String]
    # @!attribute [r] ends_at
    #   @return [String]

    normal_attr_reader :id,
                       :text,
                       :created_at,
                       :updated_at,
                       :scheduled_at,
                       :starts_at,
                       :ends_at

    predicate_attr_reader :published,
                          :all_day,
                          :read

    collection_attr_reader :reactions, Mastodon::AnnouncementReaction

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end
  end
end
