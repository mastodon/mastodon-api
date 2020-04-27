module Mastodon
  class Collection
    include ::Enumerable

    def initialize(items, klass, headers = nil)
      @collection = items.map { |attributes| klass.new(attributes) }
      @link = {}
      (headers ? headers.get("Link") : []).each do |link_values|
        link_values.split(",").map(&:strip).each do |link_value|
          uri_ref_part, *link_params = link_value.split(";").map(&:strip)
          next unless uri_ref_part && uri_ref_part =~ /\A<(.*)>\z/
          uri_ref = $1
          rel_types_raw = link_params.find { |param| break $1 if param =~ /\Arel=(.*)\z/ }
          if rel_types_raw =~ /\A"(.*)"\z/
            rel_types = $1.split(/\s+/)
          else
            rel_types = [rel_types_raw].compact
          end
          rel_types.each do |rel_type|
            @link[rel_type] = uri_ref
          end
        end
      end
    end

    def each(start = 0)
      return to_enum(:each, start) unless block_given?

      Array(@collection[start..-1]).each do |element|
        yield(element)
      end

      self
    end

    def size
      @collection.size
    end

    def last
      @collection.last
    end

    def next_max_id
      return unless @link["next"]
      uri = Addressable::URI.parse(@link["next"])
      uri.query_values["max_id"].to_i
    end

    def prev_since_id
      return unless @link["prev"]
      uri = Addressable::URI.parse(@link["prev"])
      uri.query_values["since_id"].to_i
    end
  end
end
