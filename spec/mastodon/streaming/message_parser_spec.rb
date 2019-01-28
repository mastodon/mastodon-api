require 'spec_helper'

describe Mastodon::Streaming::MessageParser do
  let(:parser) { Mastodon::Streaming::MessageParser }

  describe 'parse' do
    it 'works for update events' do
      data = { 'id' => 123 }
      result = parser.parse('update', data)
      expect(result).to be_a(Mastodon::Status)
    end

    it 'works for notifications' do
      data = { 'id' => 123 }
      result = parser.parse('notification', data)
      expect(result).to be_a(Mastodon::Notification)
    end

    it 'works for deletes' do
      data = '123'
      result = parser.parse('delete', data)
      expect(result).to be_a(Mastodon::Streaming::Events::StatusDelete)
      expect(result.id).to eql(123)
    end
  end
end
