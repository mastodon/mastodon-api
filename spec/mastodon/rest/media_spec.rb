require 'spec_helper'

describe Mastodon::REST::Media do
  before do
    @client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: '123456')
  end

  describe '#upload_media' do
    pending
  end
end
