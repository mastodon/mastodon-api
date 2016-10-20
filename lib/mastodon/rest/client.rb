require 'mastodon/client'
require 'mastodon/rest/api'

module Mastodon
  module REST
    class Client < Mastodon::Client
      include Mastodon::REST::API
    end
  end
end
