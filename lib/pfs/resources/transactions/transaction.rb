# frozen_string_literal: true

module PFS
  module Resources
    module Transactions
      class Transaction
        attr_reader :amount,
                    :currency,
                    :transaction_description,
                    :transaction_origin,
                    :transaction_type,
                    :date,
                    :unique_reference,
                    :transfer_response_reference

        def self.from_raw(raw_transaction)
          new(
            amount: raw_transaction[:amount],
            currency: raw_transaction[:currency],
            transaction_description: raw_transaction[:transactionDescription],
            transaction_origin: raw_transaction[:transactionOrigin],
            transaction_type: raw_transaction[:transactionType],
            date: raw_transaction[:date],
            unique_reference: raw_transaction[:uniqueReference],
            transfer_response_reference: raw_transaction[:terminalID]
          )
        end

        def initialize(
          amount:,
          currency:,
          transaction_description:,
          transaction_origin:,
          transaction_type:,
          date:,
          unique_reference:,
          transfer_response_reference:
        )
          @amount = amount
          @currency = currency
          @transaction_description = transaction_description
          @transaction_origin = transaction_origin
          @transaction_type = transaction_type
          @date = date
          @unique_reference = unique_reference
          @transfer_response_reference = transfer_response_reference
        end
      end
    end
  end
end
