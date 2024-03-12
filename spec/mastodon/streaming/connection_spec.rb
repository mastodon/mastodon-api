require 'spec_helper'

class DummyTCPSocket; end
class DummySSLSocket; end

class DummyResponse
  def initiailze
    yield
  end

  def <<(data); end
end

describe Mastodon::Streaming::Connection do
  describe 'initialize' do
    context 'no options provided' do
      subject(:connection) { Mastodon::Streaming::Connection.new }

      it 'sets the default socket classes' do
        expect(connection.tcp_socket_class).to eq TCPSocket
        expect(connection.ssl_socket_class).to eq OpenSSL::SSL::SSLSocket
      end
    end

    context 'custom socket classes provided in opts' do
      subject(:connection) do
        Mastodon::Streaming::Connection.new(tcp_socket_class: DummyTCPSocket, ssl_socket_class: DummySSLSocket)
      end

      it 'sets the default socket classes' do
        expect(connection.tcp_socket_class).to eq DummyTCPSocket
        expect(connection.ssl_socket_class).to eq DummySSLSocket
      end
    end
  end

  describe 'stream' do
    subject(:connection) { Mastodon::Streaming::Connection.new }

    let(:request) { double(HTTP::Request) }
    let(:client) { double('client') }
    let(:response) { Mastodon::Streaming::Response.new }

    it 'sends data to response' do
      expect(connection).to receive(:connect).with(request).and_return(client)
      expect(request).to receive(:stream).with(client)
      expect(client).to receive(:readpartial).and_return("HTTP/1.1 200 OK\n\n:thump", nil)

      connection.stream(request, response)
    end
  end

  describe 'connection' do
    subject(:connection) do
      Mastodon::Streaming::Connection.new(using_ssl: true, tcp_socket_class: DummyTCPSocket, ssl_socket_class: DummySSLSocket)
    end

    let(:method) { :get }
    let(:uri)    { 'https://mastodon.social//api/v1/streaming/user' }
    let(:ssl_socket) { double('ssl_socket') }

    let(:request) { HTTP::Request.new(verb: method, uri:) }

    it 'requests via the proxy' do
      expect(connection.ssl_socket_class).to receive(:new).and_return(ssl_socket)
      allow(ssl_socket).to receive(:connect)
      allow(ssl_socket).to receive(:hostname=).with('mastodon.social')

      expect(connection).to receive(:new_tcp_socket).with('mastodon.social', 443)
      connection.connect(request)
    end
  end
end
