Mastodon API Ruby Gem
=====================

[![Gem Version](http://img.shields.io/gem/v/mastodon-api.svg)][gem]
[![Build Status](http://img.shields.io/travis/Gargron/mastodon-api.svg)][travis]
[![Dependency Status](http://img.shields.io/gemnasium/Gargron/mastodon-api.svg)][gemnasium]

[gem]: https://rubygems.org/gems/mastodon-api
[travis]: https://travis-ci.org/Gargron/mastodon-api
[gemnasium]: https://gemnasium.com/Gargron/mastodon-api

A ruby interface for the [Mastodon](https://github.com/Gargron/mastodon) API.

    gem install mastodon-api

## Usage

    require 'mastodon-api'

    client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: your_access_token)

For a full list of available methods, see [the docs](http://www.rubydoc.info/gems/mastodon-api/Mastodon/REST/API)
