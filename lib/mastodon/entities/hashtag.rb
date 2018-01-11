module Mastodon
  module Entities
    class Hashtag < Mastodon::Base
      # @!attribute [r] name
      #   @return [String]
      # @!attribute [r] url
      #   @return [String]

      normal_attr_reader :name, :url
    end
  end
end
