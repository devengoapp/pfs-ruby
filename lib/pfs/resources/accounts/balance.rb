# frozen_string_literal: true

module PFS
  module Resources
    module Accounts
      class Balance < Base
        attr_accessor :currency,
                      :availableBalance,
                      :ledgerBalance

        alias available availableBalance
        alias ledger ledgerBalance
      end
    end
  end
end
