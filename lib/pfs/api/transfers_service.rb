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
        response = client.post("/BankPayment/#{account_id}/OneOffPayment", data, options)
        Resources::Transfers::Transfer.new(response.body[:data])
      end
    end
  end
end
