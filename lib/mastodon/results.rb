require 'mastodon/account'
require 'mastodon/status'

module Mastodon
  class Results < Mastodon::Base
    collection_attr_reader :accounts, Mastodon::Account
    collection_attr_reader :statuses, Mastodon::Status
    collection_attr_reader :hashtags, String
  end
end
