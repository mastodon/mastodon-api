module Mastodon
  class Headers
    # @param client [Mastodon::Client]
    def initialize(client)
      @client = client
    end

    # @return [Hash]
    def request_headers
      {
        user_agent: @client.user_agent,
        accept: '*/*',
        authorization: "Bearer #{@client.bearer_token}",
      }
    end
  end
end
