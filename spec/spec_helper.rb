require 'simplecov'

SimpleCov.start do
  add_filter '/spec/'
end

require 'mastodon'
require 'rspec'
require 'timecop'
require 'webmock/rspec'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def fixture(name)
  File.new(File.join(File.expand_path('../fixtures', __FILE__), 'requests', name))
end
