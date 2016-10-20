require 'mastodon/rest/statuses'
require 'mastodon/rest/accounts'
require 'mastodon/rest/timelines'

module Mastodon
  module REST
    module API
      include Mastodon::REST::Statuses
      include Mastodon::REST::Accounts
      include Mastodon::REST::Timelines
    end
  end
end
