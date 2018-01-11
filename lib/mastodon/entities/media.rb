module Mastodon
  module Entities
    class Media < Mastodon::Base
      # @!attribute [r] id
      #   @return [Integer]
      # @!attribute [r] url
      #   @return [String]
      # @!attribute [r] remote_url
      #   @return [String]
      # @!attribute [r] preview_url
      #   @return [String]
      # @!attribute [r] type
      #   @return [String]
      # @!attribute [r] meta
      #   @return [Hash]
      # @!attribute [r] description
      #   @return [String]

      normal_attr_reader :id,
                         :url,
                         :remote_url,
                         :preview_url,
                         :type,
                         :meta,
                         :description
    end
  end
end
