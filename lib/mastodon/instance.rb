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
    # @!attribute [r] stats
    #   @return [Hash]
    # @!attribute [r] languages
    #   @return [Array<String>]
    # @!attribute [r] contact_account
    #   @return [Mastodon::Account]

    normal_attr_reader :uri,
                       :title,
                       :description,
                       :email,
                       :version,
                       :urls,
                       :stats,
                       :languages

    object_attr_reader :contact_account, Mastodon::Account
  end
end
