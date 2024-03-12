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
    before do
      stub_request(:post, 'https://mastodon.social/api/v1/accounts/1/follow').to_return(fixture('follow.json'))
    end

    it 'returns the original status' do
      relationship = @client.follow(1)
      expect(relationship).to be_a Mastodon::Relationship
      expect(relationship.id).to eq 1
      expect(relationship).to be_following
    end
  end

  describe '#remote_follow' do
    before do
      stub_request(:post, 'https://mastodon.social/api/v1/follows').to_return(fixture('remote-follow.json'))
    end

    it 'returns the local representation of the followed account' do
      account = @client.remote_follow('muffinista@mastodon.social')
      expect(account).to be_a Mastodon::Account
      expect(account.id).to eq 2
    end
  end

  describe '#unfollow' do
    before do
      stub_request(:post, 'https://mastodon.social/api/v1/accounts/1/unfollow').to_return(fixture('unfollow.json'))
    end

    it 'returns the original status' do
      relationship = @client.unfollow(1)
      expect(relationship).to be_a Mastodon::Relationship
      expect(relationship.id).to eq 1
      expect(relationship).not_to be_following
    end
  end

  describe '#block' do
    before do
      stub_request(:post, 'https://mastodon.social/api/v1/accounts/1/block').to_return(fixture('block.json'))
    end

    it 'returns the original status' do
      relationship = @client.block(1)
      expect(relationship).to be_a Mastodon::Relationship
      expect(relationship.id).to eq 1
      expect(relationship).to be_blocking
    end
  end

  describe '#unblock' do
    before do
      stub_request(:post, 'https://mastodon.social/api/v1/accounts/1/unblock').to_return(fixture('unblock.json'))
    end

    it 'returns the original status' do
      relationship = @client.unblock(1)
      expect(relationship).to be_a Mastodon::Relationship
      expect(relationship.id).to eq 1
      expect(relationship).not_to be_blocking
    end
  end
end
