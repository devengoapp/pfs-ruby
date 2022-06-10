# frozen_string_literal: true

module PFS
  module Resources
    module Transactions
      class Transaction < Base
        attr_accessor :date,
                      :amount,
                      :currency,
                      :availableBalance,
                      :ledgerBalance,
                      :transactionOrigin,
                      :transactionType,
                      :transactionDescription,
                      :transactionCodeDescription,
                      :transactionResult,
                      :terminalID,
                      :terminalLocation,
                      :terminalOwner,
                      :terminalCity,
                      :terminalState,
                      :terminalCountry,
                      :terminalCurrency,
                      :uniqueReference,
                      :cardType,
                      :mti,
                      :arn,
                      :stn,
                      :authenticationNumber,
                      :recordType,
                      :fee,
                      :atmFee,
                      :issuerFee,
                      :foreignExchangeFee,
                      :clientId,
                      :mcc,
                      :surcharge,
                      :responseCode,
                      :originalTransactionAmount,
                      :originalHoldAmount,
                      :conversionRate,
                      :cardAcceptorIdCode,
                      :actionCodeDescription,
                      :acquiringInstitution,
                      :processor,
                      :posEntryMode,
                      :walletProvider,
                      :cardId,
                      :walletId

        alias available availableBalance
        alias ledger availableBalance
        alias transaction_origin transactionOrigin
        alias transaction_type transactionType
        alias transaction_description transactionDescription
        alias transaction_code_description transactionCodeDescription
        alias transaction_result transactionResult
        alias terminal_id terminalID
        alias transfer_response_reference terminalID
        alias terminal_location terminalLocation
        alias terminal_owner terminalOwner
        alias terminal_city terminalCity
        alias terminal_state terminalState
        alias terminal_country terminalCountry
        alias terminal_currency terminalCurrency
        alias unique_reference uniqueReference
        alias card_type cardType
        alias authentication_number authenticationNumber
        alias record_type recordType
        alias atm_fee atmFee
        alias foreign_exchange_fee foreignExchangeFee
        alias issuer_fee issuerFee
        alias client_id clientId
        alias response_code responseCode
        alias original_transaction_amount originalTransactionAmount
        alias original_hold_amount originalHoldAmount
        alias conversion_rate conversionRate
        alias card_acceptor_id_code cardAcceptorIdCode
        alias action_code_description actionCodeDescription
        alias acquiring_institution acquiringInstitution
        alias pos_entry_mode posEntryMode
        alias wallet_provider walletProvider
        alias card_id cardId
        alias wallet_id walletId
      end
    end
  end
end
