module Mastodon
  class Instance < Mastodon::Base
    # @!attribute [r] uri
    #   @return [String]
    # @!attribute [r] title
    #   @return [String]
    # @!attribute [r] description
    #   @return [String]
    # @!attribute [r] email
    #   @return [String]

    normal_attr_reader :uri, :title, :description, :email
  end
end
