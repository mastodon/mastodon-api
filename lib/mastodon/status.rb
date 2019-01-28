require 'mastodon/account'
require 'mastodon/entities/media'
require 'mastodon/entities/mention'
require 'mastodon/entities/app'
require 'mastodon/entities/hashtag'
require 'mastodon/emoji'
require 'mastodon/card'

module Mastodon
  class Status < Mastodon::Base
    # @!attribute [r] id
    #   @return [String]
    # @!attribute [r] in_reply_to_id
    #   @return [String]
    # @!attribute [r] in_reply_to_account_id
    #   @return [String]
    # @!attribute [r] spoiler_text
    #   @return [String]
    # @!attribute [r] content
    #   @return [String]
    # @!attribute [r] url
    #   @return [String]
    # @!attribute [r] uri
    #   @return [String]
    # @!attribute [r] created_at
    #   @return [String]
    # @!attribute [r] reblogs_count
    #   @return [Integer]
    # @!attribute [r] favourites_count
    #   @return [Integer]
    # @!attribute [r] visibility
    #   @return [String]
    # @!attribute [r] language
    #   @return [String]
    # @!attribute [r] account
    #   @return [Mastodon::Account]
    # @!attribute [r] reblog
    #   @return [Mastodon::Status]
    # @!attribute [r] application
    #   @return [Mastodon::Entities::App]
    # @!attribute [r] favourited?
    #   @return [Boolean]
    # @!attribute [r] reblogged?
    #   @return [Boolean]
    # @!attribute [r] sensitive?
    #   @return [Boolean]
    # @!attribute [r] muted?
    #   @return [Boolean]
    # @!attribute [r] pinned?
    #   @return [Boolean]
    # @!attribute [r] media_attachments
    #   @return [Mastodon::Collection<Mastodon::Entities::Media>]
    # @!attribute [r] mentions
    #   @return [Mastodon::Collection<Mastodon::Entities::Mention>]
    # @!attribute [r] tags
    #   @return [Mastodon::Collection<Mastodon::Entities::Hashtag>]
    # @!attribute [r] emojis
    #   @return [Mastodon::Collection<Mastodon::Emoji>]
    # @!attribute [r] card
    #   @return [Mastodon::Card]

    normal_attr_reader :id,
                       :content,
                       :in_reply_to_id,
                       :in_reply_to_account_id,
                       :url,
                       :uri,
                       :created_at,
                       :reblogs_count,
                       :favourites_count,
                       :visibility,
                       :spoiler_text,
                       :language

    predicate_attr_reader :favourited,
                          :reblogged,
                          :sensitive,
                          :muted,
                          :pinned

    object_attr_reader :account, Mastodon::Account
    object_attr_reader :reblog, Mastodon::Status
    object_attr_reader :application, Mastodon::Entities::App
    object_attr_reader :card, Mastodon::Card

    collection_attr_reader :media_attachments, Mastodon::Entities::Media
    collection_attr_reader :mentions, Mastodon::Entities::Mention
    collection_attr_reader :emojis, Mastodon::Emoji
    collection_attr_reader :tags, Mastodon::Entities::Hashtag

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end
  end
end
