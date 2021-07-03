module Mastodon
  class IdentityProof < Mastodon::Base
    # @!attribute [r] provider
    #   @return [String]
    # @!attribute [r] provider_username
    #   @return [String]
    # @!attribute [r] updated_at
    #   @return [String]
    # @!attribute [r] proof_url
    #   @return [String]
    # @!attribute [r] profile_url
    #   @return [String]

    normal_attr_reader :provider,
                       :provider_username,
                       :updated_at,
                       :proof_url,
                       :profile_url
  end
end
