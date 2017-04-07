module Mastodon
  class Notification < Mastodon::Base
    # @!attribute [r] id
    #   @return [Integer]
    # @!attribute [r] type
    #   @return [String]
    # @!attribute [r] created_at
    #   @return [Time]
    # @!attribute [r] account
    #   @return [Mastodon::Account]
    # @!attribute [r] status
    #   @return [Mastodon::Status]

    normal_attr_reader :id, :type, :created_at

    object_attr_reader :account, Mastodon::Account
    object_attr_reader :status, Mastodon::Status

    def initialize(attributes = {})
      attributes.fetch('id')
      super
    end

    # Does this notification include a status?
    # @return [Boolean] true if a status is included, false otherwise
    def status?
      attributes.key?('status')
    end
  end
end
