require 'mastodon/account'
require 'mastodon/entities/media'
require 'mastodon/entities/mention'

module Mastodon
  class Status < Mastodon::Base
    # @!attribute [r] id
    #   @return [Integer]
    # @!attribute [r] in_reply_to_id
    #   @return [Integer]
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
    # @!attribute [r] account
    #   @return [Mastodon::Account]
    # @!attribute [r] reblog
    #   @return [Mastodon::Status]
    # @!attribute [r] favourited?
    #   @return [Boolean]
    # @!attribute [r] reblogged?
    #   @return [Boolean]
    # @!attribute [r] media_attachments
    #   @return [Mastodon::Collection<Mastodon::Entities::Media>]
    # @!attribute [r] mentions
    #   @return [Mastodon::Collection<Mastodon::Entities::Mention>]

    normal_attr_reader :id, :content, :in_reply_to_id, :url, :uri, :created_at, :reblogs_count, :favourites_count

    predicate_attr_reader :favourited, :reblogged

    object_attr_reader :account, Mastodon::Account
    object_attr_reader :reblog, Mastodon::Status

    collection_attr_reader :media_attachments, Mastodon::Entities::Media
    collection_attr_reader :mentions, Mastodon::Entities::Mention

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end
  end
end
