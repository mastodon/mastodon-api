module Mastodon
  module Streaming
    module Events
      class StatusDelete
        # @!attribute [r] id
        #   @return [Integer]

        attr_reader :id

        def initialize(id)
          @id = id.to_i
        end
      end
    end
  end
end
