Mastodon API Ruby Gem
=====================

A ruby interface for the [Mastodon](https://github.com/Gargron/mastodon) API.

    gem install mastodon-api

## Usage

    require 'mastodon-api'

    client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: your_access_token)

For a full list of available methods, see [the docs](http://www.rubydoc.info/gems/mastodon-api/Mastodon/REST/API)
