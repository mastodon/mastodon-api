require 'spec_helper'

describe Mastodon::REST::Notifications do
  RSpec.shared_examples 'a notification object' do |type, status|
    it { is_expected.to be_a Mastodon::Notification }

    it "is a #{type}" do
      expect(subject.type).to eql(type)
    end
    it 'has an Account' do
      expect(subject.account).to be_a Mastodon::Account
    end

    it 'checks for status' do
      expect(subject.status?).to eql(status)
    end

    if status == true
      it 'has a Status' do
        expect(subject.status).to be_a Mastodon::Status
      end
    end
  end

  before do
    @client = Mastodon::REST::Client.new(base_url: 'https://mastodon.social', bearer_token: '123456')
    stub_request(:get, 'https://mastodon.social/api/v1/notifications').to_return(fixture('notifications.json'))
  end

  describe '#notifications' do
    let(:notifications) { @client.notifications }

    it 'returns a collection of notifications' do
      expect(notifications).to be_a Mastodon::Collection
    end

    context 'parses follows' do
      subject { notifications.to_a[0] }
      it_should_behave_like 'a notification object', 'follow', false
    end

    context 'parses favourites' do
      subject { notifications.to_a[1] }
      it_should_behave_like 'a notification object', 'favourite', true
    end

    context 'parses reblogs' do
      subject { notifications.to_a[2] }
      it_should_behave_like 'a notification object', 'reblog', true
    end

    context 'parses mentions' do
      subject { notifications.to_a[3] }
      it_should_behave_like 'a notification object', 'mention', true
    end
  end
end
