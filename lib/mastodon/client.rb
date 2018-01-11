require 'mastodon/version'

module Mastodon
  class Client
    DEFAULT_TIMEOUT = {
      connect: 2,
      read: 5,
      write: 20,
    }.freeze

    attr_reader :base_url, :bearer_token, :timeout

    # @param options [Hash]
    # @option options :base_url [String] URL of the instance you want to connect to
    # @option options :bearer_token [String] OAuth access token for your authenticated user
    def initialize(options = {})
      @base_url     = options[:base_url]
      @bearer_token = options[:bearer_token]
      @timeout      = DEFAULT_TIMEOUT.merge(options[:timeout] || {})
    end

    # User agent of the client
    # @return [String]
    def user_agent
      @user_agent ||= "MastodonRubyGem/#{Mastodon::Version}"
    end
  end
end
