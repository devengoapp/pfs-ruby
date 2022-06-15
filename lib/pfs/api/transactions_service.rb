# frozen_string_literal: true

module PFS
  module API
    class TransactionsService < Service
      def history(account_id:, start_date:, end_date:)
        response = client.get("/Account/#{account_id}/Transactions?StartDate=#{start_date}&EndDate=#{end_date}")
        transactions_raw = response.body.dig(:data, :transactions)
        Resources::Transactions::Transactions.new(response, response.body.dig(:data, :transactions))
      end
    end
  end
end
