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
    # @!attribute [r] version
    #   @return [String]
    # @!attribute [r] urls
    #   @return [Hash]

    normal_attr_reader :uri,
                       :title,
                       :description,
                       :email,
                       :version,
                       :urls
  end
end
