# frozen_string_literal: true

module PFS
  module Resources
    module Accounts
      class Transaction < Base
        attr_accessor :date,
                      :transactionType,
                      :authenticationNumber,
                      :transactionOrigin,
                      :transactionDescription,
                      :amount,
                      :fee,
                      :availableBalance,
                      :ledgerBalance,
                      :terminalID,
                      :terminalLocation,
                      :terminalOwner,
                      :transactionCodeDescription,
                      :transactionResult,
                      :authenticationNumber,
                      :authenticationNumber
      end
    end
  end
end
