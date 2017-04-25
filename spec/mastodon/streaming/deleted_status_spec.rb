require 'spec_helper'

describe Mastodon::Streaming::DeletedStatus do
  it 'has an ID' do
    s = Mastodon::Streaming::DeletedStatus.new(23_456)
    expect(s.id).to eql(23_456)
  end
end
