Mastodon API Ruby Gem
=====================

[![Gem Version](http://img.shields.io/gem/v/mastodon-api.svg)][gem]
[![Build Status](http://img.shields.io/travis/tootsuite/mastodon-api.svg)][travis]

[gem]: https://rubygems.org/gems/mastodon-api
[travis]: https://travis-ci.org/tootsuite/mastodon-api

A ruby interface for the [Mastodon](https://github.com/tootsuite/mastodon) API.

## Installation

    gem 'mastodon-api', require: 'mastodon'

## Documentation

All the documentation is available on [RubyDoc](http://www.rubydoc.info/gems/mastodon-api/Mastodon/REST/API).

## Usage

Assuming that you already have an access token for a user on a given Mastodon instance:

    client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: 'your_access_token')

If you need to get an access token, you must first ensure that you have the client ID and client secret for your app on the given Mastodon instance (you should save those for future calls):

    client.create_app('My Ruby App', 'http://mywebsite.com/callback')

You can then use the client ID and secret in a standard OAuth 2 authorization flow.
