require 'mastodon/status'
require 'mastodon/streaming/deleted_status'

module Mastodon
  module Streaming
    class MessageParser
      MESSAGE_TYPES = {
        'update' => Status,
        'notification' => Notification,
        'delete' => DeletedStatus,
      }.freeze

      def self.parse(type, data)
        klass = MESSAGE_TYPES[type]
        klass.new(data) if klass
      end
    end
  end
end
