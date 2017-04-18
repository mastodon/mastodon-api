module Mastodon
  module Streaming
    class DeletedStatus
      # @!attribute [r] id
      #   @return [Integer]

      attr_reader :id

      def initialize(id)
        @id = id.to_i
      end
    end
  end
end
