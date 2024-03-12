require 'spec_helper'

class FakeConnection
  def initialize(body)
    @body = body
  end

  def stream(_, response)
    @body.each_line do |line|
      response.on_body(line)
    end
  end
end

describe Mastodon::Streaming::Client do
  before do
    @client = Mastodon::Streaming::Client.new(base_url: 'https://testing.social')
  end

  describe 'before_request' do
    before(:each) do
      @client.connection = FakeConnection.new(fixture('update_streaming.txt'))
    end

    it 'runs before a request' do
      var = false
      @client.before_request do
        var = true
      end
      expect(var).to be false
      @client.user {}
      expect(var).to be true
    end

    it 'works if not specified' do
      var = false
      @client.user {}
      expect(var).to be false
    end
  end

  describe 'user' do
    it 'passes to stream' do
      expect(@client).to receive(:stream).with('user', { foo: 'bar' })
      @client.user(foo: 'bar')
    end
  end

  describe 'hashtag' do
    it 'passes to stream' do
      expect(@client).to receive(:stream).with('hashtag', { tag: 'bar' })
      @client.hashtag('bar')
    end
  end

  describe 'public' do
    it 'passes to stream' do
      expect(@client).to receive(:stream).with('public', { foo: 'bar' })
      @client.public(foo: 'bar')
    end
  end

  describe 'stream' do
    it 'passes to request' do
      expect(@client).to receive(:request).with(:get, '/api/v1/streaming/endpoint', { foo: 'bar' })
      @client.stream('endpoint', foo: 'bar')
    end
  end
end
