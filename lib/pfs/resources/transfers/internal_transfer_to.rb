# frozen_string_literal: true

module PFS
  module Resources
    module Transfers
      class InternalTransferTo < Base
        map :id, :id
        map :balance, :balance
        map :currencyCode, :currency
        map :creditedAmount, :amount
        map :loadFee, :load_fee
      end
    end
  end
end

