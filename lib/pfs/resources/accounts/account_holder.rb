# frozen_string_literal: true

module PFS
  module Resources
    module Accounts
      class AccountHolder < Base
        map :id, :id
        map :firstName, :first_name
        map :middleInitial, :middle_initial
        map :lastName, :last_name
        map :address1, :address1
        map :address2, :address2
        map :address3, :address3
        map :address4, :address4
        map :city, :city
        map :state, :state
        map :zip, :zip
        map :countryCode, :country_code
        map :countryName, :country_name
        map :countyName, :county_name
        map :phone, :phone
        map :dateOfBirth, :date_of_birth
        map :ssn, :ssn
        map :securityField1, :security_field1
        map :securityField2, :security_field2
        map :securityField3, :security_field3
        map :securityField4, :security_field4
        map :userDefined1, :user_defined1
        map :userDefined2, :user_defined2
        map :userDefined3, :user_defined3
        map :userDefined4, :user_defined4
        map :email, :email
        map :embossName, :emboss_name
        map :secondaryAddress1, :secondary_address1
        map :secondaryAddress2, :secondary_address2
        map :secondaryAddress3, :secondary_address3
        map :secondaryAddress4, :secondary_address4
        map :city2, :city2
        map :state2, :state2
        map :zip2, :zip2
        map :countryCode2, :country_code2
        map :countryName2, :country_name2
        map :countyName2, :county_name2
        map :phone2, :phone2
        map :sortCode, :sort_code
        map :sortCodeAccountNumber, :sort_code_account_number
        map :documentType, :document_type
        map :documentNumber, :document_number
        map :documentExpiryDate, :document_expiry_date
        map :nationality, :nationality
        map :countryOfIssuance, :country_of_issuance
        map :gender, :gender
        map :iban, :iban
        map :bic, :bic
        map :atmAccess, :atmAccess
        map :userDefined, :user_defined
        map :accountId, :account_id
      end
    end
  end
end
