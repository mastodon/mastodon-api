module Mastodon
  class Media < Mastodon::Base
    # @!attribute [r] id
    #   @return [String]
    # @!attribute [r] type
    #   @return [String] Image or video
    # @!attribute [r] url
    #   @return [String] Full file URL
    # @!attribute [r] remote_url
    #   @return [String]
    # @!attribute [r] preview_url
    #   @return [String] URL to preview image
    # @!attribute [r] text_url
    #   @return [String] URL that can be put into status body and will redirect to the status/media
    # @!attribute [r] meta
    #   @return [Hash]
    # @!attribute [r] description
    #   @return [String]

    normal_attr_reader :id,
                       :type,
                       :url,
                       :remote_url,
                       :preview_url,
                       :text_url,
                       :meta,
                       :description

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end
  end
end
