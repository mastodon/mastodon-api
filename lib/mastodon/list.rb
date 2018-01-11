module Mastodon
  class List < Mastodon::Base
    # @!attribute [r] id
    #   @return [String]
    # @!attribute [r] title
    #   @return [String]

    normal_attr_reader :id, :title

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end
  end
end
