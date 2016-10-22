require 'spec_helper'

describe Mastodon::Client do
  subject { Mastodon::Client.new(base_url: 'https://mastodon.social', bearer_token: '123456') }

  describe '#user_agent' do
    it 'returns the user agent string' do
      expect(subject.user_agent).to match(/MastodonRubyGem/)
    end
  end

  describe '#bearer_token' do
    it 'returns configured bearer token' do
      expect(subject.bearer_token).to eq '123456'
    end
  end

  describe '#base_url' do
    it 'returns configured base URL' do
      expect(subject.base_url).to eq 'https://mastodon.social'
    end
  end
end
