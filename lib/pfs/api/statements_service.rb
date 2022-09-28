# frozen_string_literal: true

module PFS
  module API
    class StatementsService < Service
      def by_id(account_id:, statement_id:, inward_outward:, processor:)
        response = client.get(
          "/BankPayment/#{account_id}/StatementById?statementitemid=#{statement_id}&InwardOutward=#{inward_outward}&Processor=#{processor}"
        )
        Resources::Statements::Statement.new(response, response.body.dig(:data, :transaction))
      end

      def history(account_id:, start_date:, end_date:, inward_outward:, processor:)
        response = client.get(
          "/BankPayment/#{account_id}/Statement?StartDate=#{start_date}&EndDate=#{end_date}&InwardOutward=#{inward_outward}&Processor=#{processor}"
        )
        Resources::Statements::Statements.new(response, response.body.dig(:data, :transactions))
      end
    end
  end
end