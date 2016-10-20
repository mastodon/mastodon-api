require 'spec_helper'

describe Mastodon::REST::Accounts do
  before do
    @client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: '123456')
  end

  describe '#verify_credentials' do
    before do
      stub_request(:get, "https://mastodon.social/api/v1/accounts/verify_credentials").to_return(fixture('verify_credentials.json'))
    end

    it 'returns logged in user\'s account' do
      account = @client.verify_credentials
      expect(account).to be_a Mastodon::Account
      expect(account.username).to eq 'Gargron'
    end
  end

  describe '#account' do
    before do
      stub_request(:get, "https://mastodon.social/api/v1/accounts/1").to_return(fixture('account.json'))
    end

    it 'returns an account' do
      account = @client.account(1)
      expect(account).to be_a Mastodon::Account
      expect(account.username).to eq 'Gargron'
    end
  end

  describe '#followers' do
    pending
  end

  describe '#following' do
    pending
  end

  describe '#follow_by_uri' do
    pending
  end
end
