module Mastodon
  class Emoji < Mastodon::Base
    # @!attribute [r] shortcode
    #   @return [String]
    # @!attribute [r] static_url
    #   @return [String]
    # @!attribute [r] url
    #   @return [String]

    normal_attr_reader :shortcode, :static_url, :url
  end
end
