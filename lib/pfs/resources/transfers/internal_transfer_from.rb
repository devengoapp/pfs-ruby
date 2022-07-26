# frozen_string_literal: true

module PFS
  module Resources
    module Transfers
      class InternalTransferFrom < Base
        map :id, :id
        map :balance, :balance
        map :currencyCode, :currency
        map :debitedAmount, :amount
        map :conversionRate, :conversion_rate
        map :transferFee, :transfer_fee
      end
    end
  end
end
