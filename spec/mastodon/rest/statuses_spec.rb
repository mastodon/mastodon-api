require 'spec_helper'

describe Mastodon::REST::Statuses do
  before do
    @client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: '123456')
  end

  describe '#create_status' do
    it 'returns newly created status' do
      stub_request(:post, 'https://mastodon.social/api/v1/statuses').to_return(fixture('create-status-only-text.json'))
      status = @client.create_status('Writing a ruby API lib for Mastodon')
      expect(status).to be_a Mastodon::Status
      expect(status.content).to match(/Writing a ruby API lib for Mastodon/)
    end

    it 'raises error when no text is given' do
      stub_request(:post, 'https://mastodon.social/api/v1/statuses').to_return(fixture('create-status-no-text.json'))
      expect { @client.create_status('') }.to raise_error Mastodon::Error::UnprocessableEntity
    end
  end

  describe '#status' do
    before do
      stub_request(:get, 'https://mastodon.social/api/v1/statuses/35768').to_return(fixture('status.json'))
    end

    it 'returns a status' do
      status = @client.status(35_768)
      expect(status).to be_a Mastodon::Status
      expect(status.content).to match(/youtu\.be\/HBBwXAPNLr0/)
      expect(status.account.username).to eq 'Gargron'
    end
  end

  describe '#destroy_status' do
    before do
      stub_request(:delete, 'https://mastodon.social/api/v1/statuses/35989').to_return(fixture('destroy-status.json'))
    end

    it 'returns nothing' do
      expect(@client.destroy_status(35_989)).to be true
    end
  end

  describe '#reblog' do
    before do
      stub_request(:post, 'https://mastodon.social/api/v1/statuses/35768/reblog').to_return(fixture('reblog.json'))
    end

    it 'returns a status that wraps around the reblogged status' do
      status = @client.reblog(35_768)
      expect(status).to be_a Mastodon::Status
      expect(status.reblog.id).to eq 35_768
    end
  end

  describe '#unreblog' do
    before do
      stub_request(:post, 'https://mastodon.social/api/v1/statuses/35768/unreblog').to_return(fixture('unreblog.json'))
    end

    it 'returns the originally reblogged status' do
      status = @client.unreblog(35_768)
      expect(status).to be_a Mastodon::Status
      expect(status.id).to eq 35_768
    end
  end

  describe '#favourite' do
    before do
      stub_request(:post, 'https://mastodon.social/api/v1/statuses/35768/favourite').to_return(fixture('favourite.json'))
    end

    it 'returns the original status' do
      status = @client.favourite(35_768)
      expect(status).to be_a Mastodon::Status
      expect(status.id).to eq 35_768
      expect(status).to be_favourited
    end
  end

  describe '#unfavourite' do
    before do
      stub_request(:post, 'https://mastodon.social/api/v1/statuses/35768/unfavourite').to_return(fixture('unfavourite.json'))
    end

    it 'returns the original status' do
      status = @client.unfavourite(35_768)
      expect(status).to be_a Mastodon::Status
      expect(status.id).to eq 35_768
      expect(status).to_not be_favourited
    end
  end

  describe '#statuses' do
    before do
      stub_request(:get, 'https://mastodon.social/api/v1/accounts/2/statuses').to_return(fixture('statuses.json'))
    end

    it 'returns a collection of statuses' do
      result = @client.statuses(2)
      expect(result).to be_a Mastodon::Collection
      expect(result.first).to be_a Mastodon::Status
    end
  end
end
