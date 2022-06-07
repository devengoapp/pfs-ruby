# frozen_string_literal: true

module PFS
  module Resources
    module Accounts
      class BalanceCredit < Base
        attr_accessor :amount,
                      :currencyCode,
                      :feeAmount,
                      :newBalance,
                      :oldBalance
        alias current_code currencyCode
        alias fee_amount feeAmount
        alias new_balance newBalance
        alias old_balance oldBalance
      end
    end
  end
end
