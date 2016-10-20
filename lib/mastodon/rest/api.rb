require 'mastodon/rest/statuses'
require 'mastodon/rest/accounts'
require 'mastodon/rest/timelines'
require 'mastodon/rest/relationships'
require 'mastodon/rest/media'
require 'mastodon/rest/suggestions'
require 'mastodon/rest/apps'

module Mastodon
  module REST
    module API
      include Mastodon::REST::Statuses
      include Mastodon::REST::Accounts
      include Mastodon::REST::Timelines
      include Mastodon::REST::Relationships
      include Mastodon::REST::Media
      include Mastodon::REST::Suggestions
      include Mastodon::REST::Apps
    end
  end
end
