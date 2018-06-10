require 'addressable/uri'
require 'http'
require 'json'
require 'mastodon/error'
require 'mastodon/headers'

module Mastodon
  module REST
    class Request
      def initialize(client, request_method, path, options = {})
        @client         = client
        @request_method = request_method
        @uri            = Addressable::URI.parse(@client.base_url + path)
        @headers        = Mastodon::Headers.new(@client).request_headers
        @path           = @uri.path
        @options        = options
        @headers        = @options.delete(:headers).merge @headers if @options.is_a?(Hash) && @options[:headers]
      end

      def perform
        options_key = @request_method == :get ? :params : :form
        response    = http_client.headers(@headers).public_send(@request_method, @uri.to_s, options_key => @options)
        STDERR.puts response.body if ENV['DEBUG'] == 'true'

        fail_or_return(response.code, response.body.empty? ? '' : response.parse)
      end

      private

      def fail_or_return(code, body)
        raise Mastodon::Error::ERRORS[code].from_response(body) if Mastodon::Error::ERRORS.include?(code)
        body
      end

      def http_client
        HTTP
      end
    end
  end
end
