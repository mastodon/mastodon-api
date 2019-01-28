require 'spec_helper'

describe Mastodon::REST::Suggestions do
  before do
    @client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: '123456')
  end

  describe '#suggestions' do
    before do
      stub_request(:get, 'https://mastodon.social/api/v1/suggestions').to_return(fixture('suggestions.json'))
    end

    it 'returns a collection of accounts' do
      collection = @client.suggestions
      expect(collection).to be_a Mastodon::Collection
      expect(collection.first).to be_a Mastodon::Account
    end
  end
end
