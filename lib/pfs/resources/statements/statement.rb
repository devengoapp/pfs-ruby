# frozen_string_literal: true

module PFS
  module Resources
    module Statements
      class Statement < Base
        attr_accessor :id,
                      :transactionId,
                      :amount,
                      :cardholderID,
                      :debtorBankIndentifier,
                      :debtorAccountIdentifier,
                      :debtorFullName,
                      :debtorFullAddress,
                      :debtorCountryCode,
                      :creditorBankIdentifier,
                      :creditorAccountIdentifier,
                      :creditorFullName,
                      :creditorFullAddress,
                      :creditorCountryCode,
                      :reference,
                      :dateTimeEntered,
                      :inwardOutward,
                      :processorType,
                      :paymentStatus,
                      :userDefinedFields

        alias transaction_id transactionId
        alias cardholder_id cardholderID
        alias debtor_bank_identifier debtorBankIndentifier
        alias debtor_account_identifier debtorAccountIdentifier
        alias debtor_full_name debtorFullName
        alias debtor_full_address debtorFullAddress
        alias debtor_country_code debtorCountryCode
        alias creditor_bank_identifier creditorBankIdentifier
        alias creditor_account_identifier creditorAccountIdentifier
        alias creditor_full_name creditorFullName
        alias creditor_full_address creditorFullAddress
        alias creditor_country_code creditorCountryCode
        alias entered_at dateTimeEntered
        alias inward_outward inwardOutward
        alias processor_type processorType
        alias status paymentStatus
        alias user_defined_fields userDefinedFields

      end
    end
  end
end
