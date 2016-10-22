module Mastodon
  class Error < StandardError
    ClientError         = Class.new(self)
    BadRequest          = Class.new(ClientError)
    Unauthorized        = Class.new(ClientError)
    Forbidden           = Class.new(ClientError)
    UnprocessableEntity = Class.new(ClientError)
    TooManyRequests     = Class.new(ClientError)

    ServerError         = Class.new(self)
    InternalServerError = Class.new(ServerError)
    BadGateway          = Class.new(ServerError)
    ServiceUnavailable  = Class.new(ServerError)
    GatewayTimeout      = Class.new(ServerError)

    ERRORS = {
      400 => Mastodon::Error::BadRequest,
      401 => Mastodon::Error::Unauthorized,
      403 => Mastodon::Error::Forbidden,
      422 => Mastodon::Error::UnprocessableEntity,
      429 => Mastodon::Error::TooManyRequests,
      500 => Mastodon::Error::InternalServerError,
      502 => Mastodon::Error::BadGateway,
      503 => Mastodon::Error::ServiceUnavailable,
      504 => Mastodon::Error::GatewayTimeout
    }.freeze

    class << self
      def from_response(body)
        new(body['error'])
      end
    end
  end
end
