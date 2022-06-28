# frozen_string_literal: true

module PFS
  module Resources
    module Accounts
      class IssuedAccount < Base
        attr_accessor :id,
                      :availableBalance,
                      :ledgerBalance,
                      :status,
                      :expiryDate,
                      :ddaNumber,
                      :walletId,
                      :clientWalletId,
                      :cardNumber,
                      :cvv2,
                      :accountId,
                      :sequenceCode


        alias available availableBalance
        alias ledger ledgerBalance
        alias expiration_date expiryDate
        alias dda_number ddaNumber
        alias wallet_id walletId
        alias client_wallet_id clientWalletId
        alias card_number cardNumber
        alias account_id accountId
        alias sequence_code sequenceCode
      end
    end
  end
end
