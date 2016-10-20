require 'mastodon/version'

module Mastodon
  class Client
    attr_reader :base_url, :bearer_token

    # @param options [Hash]
    # @option options :base_url [String] URL of the instance you want to connect to
    # @option options :bearer_token [String] OAuth access token for your authenticated user
    def initialize(options = {})
      @base_url     = options[:base_url]
      @bearer_token = options[:bearer_token]
    end

    # User agent of the client
    # @return [String]
    def user_agent
      @user_agent ||= "MastodonRubyGem/#{Mastodon::Version}"
    end
  end
end
