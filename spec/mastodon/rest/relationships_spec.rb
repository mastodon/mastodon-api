require 'spec_helper'

describe Mastodon::REST::Relationships do
  before do
    @client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: '123456')
  end

  describe '#relationships' do
    before do
      stub_request(:get, 'https://mastodon.social/api/v1/accounts/relationships?id%5B%5D=236&id%5B%5D=365').to_return(fixture('relationships.json'))
    end

    it 'returns a collection of relationships' do
      collection = @client.relationships(365, 236)
      expect(collection).to be_a Mastodon::Collection
      expect(collection.first).to be_a Mastodon::Relationship
      expect(collection.first.id).to eq 236
      expect(collection.first.following?).to be false
      expect(collection.last.id).to eq 365
      expect(collection.last.following?).to be true
    end
  end

  describe '#follow' do
    pending
  end

  describe '#unfollow' do
    pending
  end

  describe '#block' do
    pending
  end

  describe '#unblock' do
    pending
  end
end
