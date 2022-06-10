# frozen_string_literal: true

module PFS
  module Resources
    module Transactions
      class Transactions < Collection
        def initialize(attributes_collection)
          super(Transaction, attributes_collection)
        end
      end
    end
  end
end
