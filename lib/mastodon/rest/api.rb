require 'mastodon/rest/statuses'
require 'mastodon/rest/accounts'
require 'mastodon/rest/timelines'
require 'mastodon/rest/notifications'
require 'mastodon/rest/search'
require 'mastodon/rest/relationships'
require 'mastodon/rest/media'
require 'mastodon/rest/suggestions'
require 'mastodon/rest/apps'
require 'mastodon/rest/instances'
require 'mastodon/rest/custom_emojis'
require 'mastodon/rest/domain_blocks'
require 'mastodon/rest/filters'
require 'mastodon/rest/endorsements'
require 'mastodon/rest/reports'
require 'mastodon/rest/lists'
require 'mastodon/rest/scheduled_statuses'
require 'mastodon/rest/conversations'

module Mastodon
  module REST
    module API
      include Mastodon::REST::Statuses
      include Mastodon::REST::Accounts
      include Mastodon::REST::Timelines
      include Mastodon::REST::Notifications
      include Mastodon::REST::Search
      include Mastodon::REST::Relationships
      include Mastodon::REST::Media
      include Mastodon::REST::Suggestions
      include Mastodon::REST::Apps
      include Mastodon::REST::Instances
      include Mastodon::REST::CustomEmojis
      include Mastodon::REST::DomainBlocks
      include Mastodon::REST::Filters
      include Mastodon::REST::Endorsements
      include Mastodon::REST::Suggestions
      include Mastodon::REST::Reports
      include Mastodon::REST::Lists
      include Mastodon::REST::ScheduledStatuses
      include Mastodon::REST::Conversations
    end
  end
end
