require 'spec_helper'

describe Mastodon::REST::Media do
  before do
    @client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: '123456')
    stub_request(:post, 'https://mastodon.social/api/v1/media').to_return(fixture('media.json'))
  end

  describe '#upload_media' do
    it 'works with a File' do
      path = File.join(File.dirname(__FILE__), '..', '..', 'fixtures', 'upload.png')
      media = @client.upload_media(File.new(path))
      expect(media).to be_a Mastodon::Media
    end

    it 'works with a description' do
      path = File.join(File.dirname(__FILE__), '..', '..', 'fixtures', 'upload.png')
      expect(@client).to receive(:perform_request_with_object).with(anything, anything, hash_including(description: 'Lorem ipsum'), anything)
      @client.upload_media(File.new(path), description: 'Lorem ipsum')
    end

    it 'works with a StringIO' do
      media = @client.upload_media(StringIO.new)
      expect(media).to be_a Mastodon::Media
    end

    it 'works with a HTTP::FormData::File' do
      path = File.join(File.dirname(__FILE__), '..', '..', 'fixtures', 'upload.png')
      f = HTTP::FormData::File.new(path)
      media = @client.upload_media(f)
      expect(media).to be_a Mastodon::Media
    end
  end

  describe '#update_media' do
    let(:media_id) { 123 }

    it 'sends the two possible params over' do
      opts = { description: 'A test description', focus: '1.0,2.3' }

      stub_request(:put, 'https://mastodon.social/api/v1/media/123')
        .with(body: opts)
        .to_return(fixture('media.json'))
      media = @client.update_media(media_id, opts)
      expect(media).to be_a Mastodon::Media
    end
  end
end
