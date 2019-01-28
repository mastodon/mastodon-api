module Mastodon
  class Hashtag < Mastodon::Base
    # @!attribute [r] name
    #   @return [String]
    # @!attribute [r] url
    #   @return [String]
    # @!attribute [r] history
    #   @return [Array<Hash>]

    normal_attr_reader :name,
                       :url,
                       :history

    def initialize(attributes = {})
      attributes.fetch('name')
      super
    end
  end
end
