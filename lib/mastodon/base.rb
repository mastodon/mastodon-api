module Mastodon
  class Base
    attr_reader :attributes

    alias to_h    attributes
    alias to_hash attributes

    def initialize(attributes = {})
      @attributes = attributes
    end

    class << self
      def normal_attr_reader(*attributes)
        attributes.each do |attribute|
          define_attribute_method(attribute)
        end
      end

      def object_attr_reader(attribute, klass)
        define_method(attribute) do
          klass.new(@attributes[attribute.to_s])
        end
      end

      def predicate_attr_reader(*attributes)
        attributes.each do |attribute|
          define_predicate_method(attribute)
        end
      end

      def define_predicate_method(key)
        define_method("#{key}?") do
          @attributes[key.to_s]
        end
      end

      def define_attribute_method(key)
        define_method(key) do
          @attributes[key.to_s]
        end
      end
    end
  end
end
