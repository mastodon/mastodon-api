module Mastodon
  class App < Mastodon::Base
    # @!attribute [r] client_id
    #   @return [String]
    # @!attribute [r] client_secret
    #   @return [String]

    normal_attr_reader :client_id, :client_secret
  end
end
