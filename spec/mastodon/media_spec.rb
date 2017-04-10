require 'spec_helper'

describe Mastodon::Media do
  let(:attrs) do
    {
      'id' => 4,
      'type' => 'image',
      'url' => 'http://site.com/system/media_attachments/files/000/000/004/original/4703eb0f77a3d9dd.png?1491720313',
      'preview_url' => 'http://site.com/system/media_attachments/files/000/000/004/small/4703eb0f77a3d9dd.png?1491720313',
      'text_url' => 'http://site.com/media/3srFLJIxDRROiMzvmUk',
    }
  end
  subject { Mastodon::Media.new(attrs) }

  it 'has expected values' do
    attrs.each do |key, value|
      expect(subject.send(key.to_sym)).to eql(value)
    end
  end
end
