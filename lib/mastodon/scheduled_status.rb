require 'mastodon/entities/media'

module Mastodon
  class ScheduledStatus < Mastodon::Base
    # @!attribute [r] id
    #   @return [String]
    # @!attribute [r] scheduled_at
    #   @return [String]
    # @!attribute [r] params
    #   @return [Hash]
    # @!attribute [r] media_attachments
    #   @return [Mastodon::Collection<Mastodon::Entities::Media>]

    normal_attr_reader :id,
                       :scheduled_at,
                       :params

    collection_attr_reader :media_attachments, Mastodon::Entities::Media

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end
  end
end
