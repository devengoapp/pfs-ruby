# frozen_string_literal: true

module PFS
  module API
    class TransfersService < Service
      def create(account_id, currency, amount, destination, destination_id, country, first_name, last_name, options = {})
        data = {
          currency: currency,
          paymentamount: amount,
          accountidentifier: destination,
          bankidentifier: destination_id,
          countrycode: country,
          firstname: first_name,
          lastname: last_name,
        }
        data[:isinstant] = true if options[:instant]
        data[:reference] = options[:reference] if options[:reference]
        data[:unstructuredreference] = options[:unstructuredreference] if options[:unstructuredreference]
        data[:userdefinedfields] = options[:user_defined_fields] if options[:user_defined_fields]
        response = client.post("/BankPayment/#{account_id}/OneOffPayment", data, options)
        Resources::Transfers::Transfer.new(response, response.body[:data])
      end

      def internal(from_account_id, to_account_id, amount, currency, fee_code, description, terminal_id)
        data = {
          id: from_account_id,
          toId: to_account_id,
          amount: amount,
          currencyCode: currency,
          description: description,
          feeCode: fee_code,
          terminalId: terminal_id,
        }

        response = client.post("/Account/CardholderToCardholderTransfer", data)
        Resources::Transfers::InternalTransfer.new(response, response.body[:data])
      end
    end
  end
end
