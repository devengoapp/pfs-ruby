# frozen_string_literal: true

module PFS
  module Resources
    module Statements
      class Statement
        attr_reader :id,
                    :user_defined_fields,
                    :debtor_full_name,
                    :debtor_account_identifier,
                    :debtor_bank_identifier,
                    :creditor_full_name,
                    :creditor_account_identifier,
                    :creditor_bank_identifier,
                    :reference

        def self.from_raw(raw_transaction)
          new(
            id: raw_transaction[:id],
            user_defined_fields: raw_transaction[:userDefinedFields],
            debtor_full_name: raw_transaction[:debtorFullName],
            debtor_account_identifier: raw_transaction[:debtorAccountIdentifier],
            debtor_bank_identifier: raw_transaction[:debtorBankIdentifier],
            creditor_full_name: raw_transaction[:creditorFullName],
            creditor_account_identifier: raw_transaction[:creditorAccountIdentifier],
            creditor_bank_identifier: raw_transaction[:creditorBankIdentifier],
            reference: raw_transaction[:reference]
          )
        end

        def initialize(
          id:,
          user_defined_fields:,
          debtor_full_name:,
          debtor_account_identifier:,
          debtor_bank_identifier:,
          creditor_full_name:,
          creditor_account_identifier:,
          creditor_bank_identifier:,
          reference:
        )
          @id = id
          @user_defined_fields = user_defined_fields
          @debtor_full_name = debtor_full_name
          @debtor_account_identifier = debtor_account_identifier
          @debtor_bank_identifier = debtor_bank_identifier
          @creditor_full_name = creditor_full_name
          @creditor_account_identifier = creditor_account_identifier
          @creditor_bank_identifier = creditor_bank_identifier
          @reference = reference
        end
      end
    end
  end
end
