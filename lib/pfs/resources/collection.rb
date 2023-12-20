module PFS
  module Resources
    class Collection
      include Enumerable
      attr_reader :response

      def initialize(response, item_klass, attributes_collection = [])
        @response = response
        @items = Array(attributes_collection).map { |attributes_item|
          item_klass.new(nil, attributes_item)
        }
      end

      def each(&block)
        @items.each(&block)
      end
    end
  end
end
