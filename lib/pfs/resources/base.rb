# frozen_string_literal: true

module PFS
  module Resources
    class Base
      def initialize(attributes = {})
        attributes.each do |key, value|
          m = "#{key}=".to_sym
          send(m, value) if respond_to?(m)
        end
      end
    end
  end
end

require_relative "collection"
require_relative "accounts/balance"
require_relative "accounts/balance_credit"
require_relative "authentication/token"
require_relative "transfers/transfer"
require_relative "transactions/transaction"
require_relative "transactions/transactions"
require_relative "statements/statement"
