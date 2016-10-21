require 'spec_helper'

describe Mastodon::REST::Apps do
  before do
    @client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: '123456')
  end

  describe '#create_app' do
    before do
      stub_request(:post, "https://mastodon.social/api/v1/apps").to_return(fixture('create-app.json'))
    end

    it 'returns an app' do
      app = @client.create_app('Test app', 'http://localhost:3000/callback')
      expect(app).to be_a Mastodon::App
      expect(app.client_id).to_not be_empty
      expect(app.client_secret).to_not be_empty
    end
  end
end
