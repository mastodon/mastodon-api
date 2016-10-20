module Mastodon
  class Relationship < Mastodon::Base
    normal_attr_reader :id
    predicate_attr_reader :following, :followed_by, :blocking

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end
  end
end
