module Mastodon
  class Error < StandardError
    ClientError         = Class.new(self)
    BadRequest          = Class.new(ClientError)
    Unauthorized        = Class.new(ClientError)
    Forbidden           = Class.new(ClientError)
    UnprocessableEntity = Class.new(ClientError)
    TooManyRequests     = Class.new(ClientError)

    ERRORS = {
      400 => Mastodon::Error::BadRequest,
      401 => Mastodon::Error::Unauthorized,
      403 => Mastodon::Error::Forbidden,
      422 => Mastodon::Error::UnprocessableEntity,
      429 => Mastodon::Error::TooManyRequests
    }.freeze
  end
end
