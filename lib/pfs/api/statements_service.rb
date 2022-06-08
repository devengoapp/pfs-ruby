module PFS
  module API
    class StatementsService < Service
      def by_id(account_id:, statement_id:, inward_outward:, processor:)
        response = client.get(
          "/BankPayment/#{account_id}/StatementById?StatementItemId=#{statement_id}?InwardOutward=#{inward_outward}&Processor=#{processor}"
        )
        statement_raw = response.body.dig(:data, :transaction)

        Resources::Statements::Statement.from_raw(statement_raw)
      end
    end
  end
end
