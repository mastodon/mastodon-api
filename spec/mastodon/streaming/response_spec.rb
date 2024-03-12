require 'spec_helper'

describe Mastodon::Streaming::Response do
  describe 'on_headers_complete' do
    subject { Mastodon::Streaming::Response.new }

    it 'does not error if status code is 200' do
      expect do
        subject << "HTTP/1.1 200 OK\r\nSome-Header: Woo\r\n\r\n"
      end.not_to raise_error
    end

    Mastodon::Error::ERRORS.each do |code, klass|
      it "raises an exception of type #{klass} for status code #{code}" do
        expect do
          subject << "HTTP/1.1 #{code} NOK\r\nSome-Header: Woo\r\n\r\n"
        end.to raise_error(klass)
      end
    end
  end

  describe '<<' do
    subject { Mastodon::Streaming::Response.new }

    it 'passes to on_body' do
      subject << 'HTTP/1.1 200 OK\r\n'

      expect(subject).to receive(:on_body).with(':thump')
      subject << ':thump'
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
      src = fixture('update_streaming.txt').read

      # split into two random chunks
      point = rand 5..src.length
      data1 = src.slice(0..point)
      data2 = src.slice((point + 1)..-1)

      subject.on_body(data1)
      expect(@last_type).to be_nil

      subject.on_body(data2)
      subject.on_body("\n\n")

      expect(@last_type).to eql('update')
      expect(@data['id']).to eql(29_443)
    end
  end
end
