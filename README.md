Mastodon API Ruby Gem
=====================

[![Gem Version](http://img.shields.io/gem/v/mastodon-api.svg)][gem]
[![Build Status](http://img.shields.io/travis/Gargron/mastodon-api.svg)][travis]
[![Dependency Status](http://img.shields.io/gemnasium/Gargron/mastodon-api.svg)][gemnasium]

[gem]: https://rubygems.org/gems/mastodon-api
[travis]: https://travis-ci.org/Gargron/mastodon-api
[gemnasium]: https://gemnasium.com/Gargron/mastodon-api

A ruby interface for the [Mastodon](https://github.com/Gargron/mastodon) API.

    gem 'mastodon-api', require: 'mastodon'

## Documentation

[RubyDoc](http://www.rubydoc.info/gems/mastodon-api/Mastodon/REST/API)

## Usage

Assuming that you already have an access token for a user on a given Mastodon instance:

    require 'mastodon-api'

    client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: 'your_access_token')

If you need to get an access token, you must first ensure that you have the client ID and client secret for your app on the given Mastodon instance (you should save those for future calls):

    client.create_app('My Ruby App', 'http://mywebsite.com/callback')

You can then use the client ID and secret in a standard OAuth 2 authorization flow.
