module Mastodon
  class App < Mastodon::Base
    # @!attribute [r] client_id
    #   @return [String]
    # @!attribute [r] client_secret
    #   @return [String]
    # @!attribute [r] name
    #   @return [String]
    # @!attribute [r] website
    #   @return [String]

    normal_attr_reader :client_id,
                       :client_secret,
                       :name,
                       :website
  end
end
