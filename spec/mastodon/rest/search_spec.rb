require 'spec_helper'

describe Mastodon::REST::Timelines do
  before do
    @client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: '123456')
  end

  describe '#search' do
    context 'keyword' do
      before do
        stub_request(:get, 'https://mastodon.social/api/v2/search?q=foo').to_return(fixture('search.json'))
      end

      it 'returns a result object' do
        results = @client.search('foo')
        expect(results).to be_a Mastodon::Results
        expect(results.accounts.first).to be_a Mastodon::Account
        expect(results.statuses.first).to be_nil
        expect(results.hashtags.first).to be_a Mastodon::Hashtag
      end
    end

    context 'Status URL' do
      before do
        stub_request(:get, 'https://mastodon.social/api/v2/search?q=https://masto.xyz/@account/123').to_return(fixture('search-by-url.json'))
      end

      it 'returns a result object' do
        results = @client.search('https://masto.xyz/@account/123')
        expect(results).to be_a Mastodon::Results
        expect(results.accounts.first).to be_nil
        expect(results.statuses.first).to be_a Mastodon::Status
      end
    end
  end
end
