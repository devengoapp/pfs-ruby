# frozen_string_literal: true

module PFS
  module API
    class AccountsService < Service
      def balance(account_id)
        response = client.get("/Account/#{account_id}/Balance")
        Resources::Accounts::Balance.new(response, response.body[:data])
      end

      def issue(bin:, dc:, style: , user_defined2: ,incorporation_date:, company_name:, first_name:, last_name:, address:, postal_code: , city:, state:, country:)
        attributes = {
          bin: bin,
          distributorcode: dc,
          cardstyle: style,
          userdefined2: user_defined2,
          companyname: company_name,
          firstname: first_name,
          lastname: last_name,
          dateofbirth: incorporation_date,
          address1: address,
          city: city,
          county: state,
          zipcode: postal_code,
          countrycode: country,
        }

        response = client.post("/Account", attributes)
        Resources::Accounts::Account.new(response, response.body[:data])
      end

      def status(account_id: )
        response = client.get("/Account/#{account_id}/Status")
        Resources::Accounts::Status.new(response, response.body[:data])
      end

      def update_status(account_id: , status_code: )
        attributes = {
          status: status_code,
        }
        client.patch("/Account/#{account_id}/Status", attributes)
        status(account_id: account_id)
      end

      def close(account_id: )
        update_status(account_id: account_id, status_code: PFS::Resources::Accounts::Status::CODES[:closed])
      end

      def credit(account_id, currency, amount, fee_code = "**API", description = "Deposit To Card API")
        attributes = {
          amount: amount,
          currencyCode: currency,
          feeCode: fee_code,
          transactionDescription: description,
        }
        response = client.post("/Account/#{account_id}/Balance/Credit", attributes)
        Resources::Accounts::BalanceCredit.new(response, response.body[:data])
      end
    end
  end
end
