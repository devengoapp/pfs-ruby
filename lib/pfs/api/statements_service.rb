module PFS
  module API
    class StatementsService < Service
      def by_id(account_id:, statement_id:, inward_outward:, processor:)
        response = client.get(
          "/BankPayment/#{account_id}/StatementById?statementitemid=#{statement_id}&InwardOutward=#{inward_outward}&Processor=#{processor}"
        )
        Resources::Statements::Statement.new(response.body.dig(:data, :transaction))
      end
    end
  end
end
