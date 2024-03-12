require 'buftok'
require 'http'
require 'json'
require 'mastodon/error'

module Mastodon
  module Streaming
    class Response
      # Initializes a new Response object
      #
      # @return [Mastodon::Streaming::Response]
      def initialize(&block)
        @block = block
        @parser = HTTP::Response::Parser.new
        @tokenizer = BufferedTokenizer.new("\n\n")
        @match = Regexp.new(/event: ([a-z]+)\ndata: (.+)/m)
      end

      def <<(data)
        @parser.add(data)
        error = Mastodon::Error::ERRORS[@parser.status_code]
        raise error if error

        on_body(data)
      end

      def on_body(data)
        @tokenizer.extract(data).each do |line|
          has_data = @match.match(line)
          next if has_data.nil?

          type = has_data[1]
          data = has_data[2]

          @block.call(type, JSON.parse(data))
        end
      end
    end
  end
end
