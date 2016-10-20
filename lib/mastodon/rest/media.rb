require 'mastodon/rest/utils'

module Mastodon
  module REST
    module Media
      include Mastodon::REST::Utils

      def upload_media(file)
        raise NotImplementedError
      end
    end
  end
end
