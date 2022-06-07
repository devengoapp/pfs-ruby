# frozen_string_literal: true

module PFS
  module API
    class AccountsService < Service
      def balance(account_id)
        response = client.get("/Account/#{account_id}/Balance")
        Resources::Accounts::Balance.new(response)
      end

      def credit(account_id, currency, amount, fee_code = "**API", description = "Deposit To Card API")
        attributes = {
          amount: amount,
          currencyCode: currency,
          feeCode: fee_code,
          transactionDescription: description,
        }
        response = client.post("/Account/#{account_id}/Balance/Credit", attributes)
        Resources::Accounts::BalanceCredit.new(response)
      end
    end
  end
end
