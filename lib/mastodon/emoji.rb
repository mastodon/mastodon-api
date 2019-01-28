module Mastodon
  class Emoji < Mastodon::Base
    # @!attribute [r] shortcode
    #   @return [String]
    # @!attribute [r] static_url
    #   @return [String]
    # @!attribute [r] url
    #   @return [String]
    # @!attribute [r] visible_in_picker?
    #   @return [Boolean]

    normal_attr_reader :shortcode, :static_url, :url

    predicate_attr_reader :visible_in_picker

    def initialize(attributes = {})
      attributes.fetch('shortcode')
      super
    end
  end
end
