module Mastodon
  class Collection
    include ::Enumerable

    def initialize(items, klass)
      @collection = items.map { |attributes| klass.new(attributes) }
    end

    def each(start = 0, &block)
      return to_enum(:each, start) unless block_given?

      Array(@collection[start..]).each(&block)

      self
    end

    def size
      @collection.size
    end

    def last
      @collection.last
    end
  end
end
