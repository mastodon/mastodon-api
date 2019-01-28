require 'mastodon/account'
require 'mastodon/status'

module Mastodon
  class Conversation < Mastodon::Base
    # @!attribute [r] id
    #   @return [String]
    # @!attribute [r] unread?
    #   @return [Boolean]
    # @!attribute [r] accounts
    #   @return [Mastodon::Collection<Mastodon::Account>]
    # @!attribute [r] last_status
    #   @return [Mastodon::Status]

    normal_attr_reader :id
    predicate_attr_reader :unread
    collection_attr_reader :accounts, Mastodon::Account
    object_attr_reader :last_status, Mastodon::Status

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end
  end
end
