module Mastodon
  class Card < Mastodon::Base
    # @!attribute [r] url
    #   @return [String]
    # @!attribute [r] title
    #   @return [String]
    # @!attribute [r] description
    #   @return [String]
    # @!attribute [r] image
    #   @return [String]
    # @!attribute [r] type
    #   @return [String]
    # @!attribute [r] author_name
    #   @return [String]
    # @!attribute [r] author_url
    #   @return [String]
    # @!attribute [r] provider_name
    #   @return [String]
    # @!attribute [r] provider_url
    #   @return [String]
    # @!attribute [r] html
    #   @return [String]
    # @!attribute [r] width
    #   @return [String]
    # @!attribute [r] height
    #   @return [String]

    normal_attr_reader :url,
                       :title,
                       :description,
                       :image,
                       :type
                       :author_name,
                       :author_url,
                       :provider_name,
                       :provider_url,
                       :html,
                       :width,
                       :height
  end
end
