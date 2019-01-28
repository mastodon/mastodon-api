require 'spec_helper'

describe Mastodon::Streaming::Events::StatusDelete do
  it 'has an ID' do
    s = Mastodon::Streaming::Events::StatusDelete.new(23_456)
    expect(s.id).to eql(23_456)
  end
end
