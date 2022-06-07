# frozen_string_literal: true

module PFS
  module Resources
    class Base
      attr_reader :response

      def initialize(response, root = :data)
        @response = response
        attributes = response.body[root]
        attributes.each do |key, value|
          m = "#{key}=".to_sym
          send(m, value) if respond_to?(m)
        end
      end
    end
  end
end

require_relative "accounts/balance"
require_relative "accounts/balance_credit"
require_relative "accounts/transaction"
require_relative "accounts/transaction"
require_relative "authentication/token"
require_relative "transfers/transfer"
require_relative "transactions/transaction"
require_relative "transactions/transactions"
