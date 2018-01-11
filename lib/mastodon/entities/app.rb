module Mastodon
  module Entities
    class App < Mastodon::Base
      # @!attribute [r] name
      #   @return [String]
      # @!attribute [r] website
      #   @return [String]

      normal_attr_reader :name, :website
    end
  end
end
