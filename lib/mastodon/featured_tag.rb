module Mastodon
  class FeaturedTag < Mastodon::Base
    # @!attribute [r] id
    #   @return [String]
    # @!attribute [r] name
    #   @return [String]
    # @!attribute [r] statuses_count
    #   @return [String]
    # @!attribute [r] last_status_at
    #   @return [String]

    normal_attr_reader :id,
                       :name,
                       :statuses_count,
                       :last_status_at
  end
end
