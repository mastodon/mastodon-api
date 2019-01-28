require 'mastodon/account'
require 'mastodon/status'
require 'mastodon/hashtag'

module Mastodon
  class Results < Mastodon::Base
    # @!attribute [r] accounts
    #   @return [Mastodon::Collection<Mastodon::Account>]
    # @!attribute [r] statuses
    #   @return [Mastodon::Collection<Mastodon::Status>]
    # @!attribute [r] hashtags
    #   @return [Mastodon::Collection<Mastodon::Hashtag>]

    collection_attr_reader :accounts, Mastodon::Account
    collection_attr_reader :statuses, Mastodon::Status
    collection_attr_reader :hashtags, Mastodon::Hashtag
  end
end
