require 'spec_helper'

describe Mastodon::Streaming::Response do
  describe 'on_headers_complete' do
    subject { Mastodon::Streaming::Response.new }
    it 'should not error if status code is 200' do
      expect do
        subject << "HTTP/1.1 200 OK\r\nSome-Header: Woo\r\n\r\n"
      end.to_not raise_error
    end

    Mastodon::Error::ERRORS.each do |code, klass|
      it "should raise an exception of type #{klass} for status code #{code}" do
        expect do
          subject << "HTTP/1.1 #{code} NOK\r\nSome-Header: Woo\r\n\r\n"
        end.to raise_error(klass)
      end
    end
  end

  describe 'on_body' do
    subject do
      Mastodon::Streaming::Response.new do |type, data|
        @last_type = type
        @data = data
      end
    end

    it 'ignores thumps' do
      subject.on_body(':thump\n:thump\n')
      expect(@last_type).to be_nil
    end

    it 'works with chunks' do
      data1 = 'event: update
data: {"id":29443,"created_at":"2017-04-14T18:05:28.000Z","in_reply_to_id":null,"in_reply_to_account_id":null,"sensitive":false,"spoiler_text":"","visibility":"public","application":null,"account":{"id":1217,"username":"hellojed","acct":"hellojed@mastodon.social","display_name":"hellojed","locked":false,"created_at":"2017-04-07T19:20:26.126Z","followers_count":1,"following_count":1,"statuses_count":201,"note":"Moped enthusiast and game developer in the Seattle area.\n\n<a href=\"https://hellojed.itch.io\" rel=\"nofollow noopener\"><span class=\"invisible\">https://</span><span class=\"\">hellojed.itch.io</span><span class=\"invisible\"></span></a>","url":"https://mastodon.social/@hellojed","avatar":"https://botsinspace.s3.amazonaws.com/accounts/avatars/000/001/217/original/'
      data2 =
        '5-1-16-3.png?1491592826","avatar_static":"https://botsinspace.s3.amazonaws.com/accounts/avatars/000/001/217/original/5-1-16-3.png?1491592826","header":"/headers/original/missing.png","header_static":"/headers/original/missing.png"},"media_attachments":[],"mentions":[],"tags":[],"uri":"tag:mastodon.social,2017-04-14:objectId=2548059:objectType=Status","content":"<p>this is a real NPM Package that http-server depends on <a href=\"https://www.npmjs.com/package/fahfahfajhfajhfajhfajhfajfaj\" rel=\"nofollow noopener\"><span class=\"invisible\">https://www.</span><span class=\"ellipsis\">npmjs.com/package/fahfahfajhfa</span><span class=\"invisible\">jhfajhfajhfajfaj</span></a></p>","url":"https://mastodon.social/users/hellojed/updates/1856764","reblogs_count":0,"favourites_count":0,"reblog":null}'

      subject.on_body(data1)
      expect(@last_type).to be_nil

      subject.on_body(data2)
      subject.on_body("\n\n")

      expect(@last_type).to eql('update')
      expect(@data['id']).to eql(29_443)
    end
  end
end
