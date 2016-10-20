Mastodon API Ruby Gem
=====================

A ruby interface for the [Mastodon](https://github.com/Gargron/mastodon) API.

    gem install mastodon

## Usage

    client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: your_access_token)

    client.create_status('Hello world!')

    client.home_timeline.each do |status|
      puts status.content
    end
