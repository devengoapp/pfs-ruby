# frozen_string_literal: true

module PFS
  module Resources
    module Transactions
      class Transactions
        include Enumerable

        def self.from_raw(raw_transactions)
          transactions = raw_transactions.map do |transaction|
            Transaction.from_raw(transaction)
          end
          new(transactions)
        end

        def initialize(transactions)
          @transactions = transactions
        end

        def each(&block)
          @transactions.each(&block)
        end
      end
    end
  end
end
