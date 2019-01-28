require 'mastodon/status'
require 'mastodon/conversation'
require 'mastodon/streaming/events/filters_change'
require 'mastodon/streaming/events/status_delete'

module Mastodon
  module Streaming
    class MessageParser
      MESSAGE_TYPES = {
        'update' => Status,
        'notification' => Notification,
        'conversation' => Conversation,
        'delete' => Events::StatusDelete,
        'filters_changed' => Events::FiltersChange,
      }.freeze

      def self.parse(type, data)
        klass = MESSAGE_TYPES[type]
        klass.new(data) if klass
      end
    end
  end
end
