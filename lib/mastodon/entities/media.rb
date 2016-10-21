module Mastodon
  module Entities
    class Media < Mastodon::Base
      # @!attribute [r] url
      #   @return [String]
      # @!attribute [r] preview_url
      #   @return [String]
      # @!attribute [r] type
      #   @return [String]

      normal_attr_reader :url, :preview_url, :type
    end
  end
end
