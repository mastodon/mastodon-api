require 'http/request'
require 'mastodon/client'
require 'mastodon/streaming/connection'
require 'mastodon/streaming/deleted_status'
require 'mastodon/streaming/message_parser'
require 'mastodon/streaming/response'

module Mastodon
  module Streaming
    class Client < Mastodon::Client
      attr_writer :connection

      # Initializes a new Client object
      #
      # @param options [Hash] A customizable set of options.
      # @option options [String] :tcp_socket_class A class that Connection will use to create a new TCP socket.
      # @option options [String] :ssl_socket_class A class that Connection will use to create a new SSL socket.
      # @return [Mastodon::Streaming::Client]
      def initialize(options = {})
        super
        options[:using_ssl] ||= base_url =~ /^https/
        @connection = Streaming::Connection.new(options)
      end

      # Streams messages for a single user
      #
      # @yield [Mastodon::Status, Mastodon::Notification, Mastodon::Streaming::DeletedStatus] A stream of Mastodon objects.
      def user(options = {}, &block)
        stream('user', options, &block)
      end

      # Returns statuses that contain the specified hashtag
      #
      # @yield [Mastodon::Status, Mastodon::Notification, Mastodon::Streaming::DeletedStatus] A stream of Mastodon objects.
      def hashtag(tag, options = {}, &block)
        options['tag'] = tag
        stream('hashtag', options, &block)
      end

      # Returns all public statuses
      #
      # @yield [Mastodon::Status, Mastodon::Notification, Mastodon::Streaming::DeletedStatus] A stream of Mastodon objects.
      def firehose(options = {}, &block)
        stream('public', options, &block)
      end

      #
      # Calls an arbitrary streaming endpoint and returns the results
      # @yield [Mastodon::Status, Mastodon::Notification, Mastodon::Streaming::DeletedStatus] A stream of Mastodon objects.
      def stream(path, options = {}, &block)
        request(:get, "/api/v1/streaming/#{path}", options, &block)
      end

      # Set a Proc to be run when connection established.
      def before_request(&block)
        if block_given?
          @before_request = block
          self
        elsif instance_variable_defined?(:@before_request)
          @before_request
        else
          proc {}
        end
      end

      private

      def request(method, path, params)
        before_request.call
        uri = Addressable::URI.parse(base_url + path)

        headers = Mastodon::Headers.new(self).request_headers

        request = HTTP::Request.new(verb: method, uri: uri + '?' + to_url_params(params), headers: headers)
        response = Streaming::Response.new do |type, data|
          if item = Streaming::MessageParser.parse(type, data) # rubocop:disable AssignmentInCondition
            yield(item)
          end
        end
        @connection.stream(request, response)
      end

      def to_url_params(params)
        uri = Addressable::URI.new
        uri.query_values = params
        uri.query
      end
    end
  end
end
