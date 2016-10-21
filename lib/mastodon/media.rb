module Mastodon
  class Media < Mastodon::Base
    # @!attribute [r] id
    #   @return [Integer]
    # @!attribute [r] type
    #   @return [String] Image or video
    # @!attribute [r] url
    #   @return [String] Full file URL
    # @!attribute [r] preview_url
    #   @return [String] URL to preview image
    # @!attribute [r] text_url
    #   @return [String] URL that can be put into status body and will redirect to the status/media

    normal_attr_reader :id, :type, :url, :preview_url, :text_url

    def initialize(attributes = {})
      attributes.fetch('id')
    end
  end
end
