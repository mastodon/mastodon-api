require 'spec_helper'

describe Mastodon::REST::Apps do
  before do
    @client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: '123456')
  end

  describe '#instance' do
    before do
      stub_request(:get, 'https://mastodon.social/api/v1/instance').to_return(fixture('instance.json'))
    end

    it 'returns an instance' do
      instance = @client.instance
      expect(instance).to be_a Mastodon::Instance
      expect(instance.uri).to eql('mastodon.social')
      expect(instance.title).to eql('Mastodon')
    end
  end
end
