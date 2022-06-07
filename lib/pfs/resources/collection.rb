# frozen_string_literal: true

module PFS
  module Resources
    class Collection
      include Enumerable

      attr_reader :response

      def initialize(response, item_klass, data)
        @response = response
        @items = (data || []).map { |item| item_klass.new(response, item) }
      end

      def each(&block)
        @items.each(&block)
      end
    end
  end
end
