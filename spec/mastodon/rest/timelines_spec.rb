require 'spec_helper'

describe Mastodon::REST::Timelines do
  before do
    @client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: '123456')
  end

  describe '#home_timeline' do
    before do
      stub_request(:get, 'https://mastodon.social/api/v1/timelines/home').to_return(fixture('home.json'))
    end

    it 'returns a collection of statuses' do
      timeline = @client.home_timeline
      expect(timeline).to be_a Mastodon::Collection
      expect(timeline.first).to be_a Mastodon::Status
    end
  end

  describe '#public_timeline' do
    before do
      stub_request(:get, 'https://mastodon.social/api/v1/timelines/public').to_return(fixture('public.json'))
    end

    it 'returns a collection of statuses' do
      timeline = @client.public_timeline
      expect(timeline).to be_a Mastodon::Collection
      expect(timeline.first).to be_a Mastodon::Status
    end
  end
end
