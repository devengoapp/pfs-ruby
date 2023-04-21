# frozen_string_literal: true

module PFS
  module API
    class AccountsService < Service
      def balance(account_id)
        response = client.get("/Account/#{account_id}/Balance")
        Resources::Accounts::Balance.new(response, response.body[:data])
      end

      def issue(bin:, dc:, style: ,incorporation_date:, company_name:, first_name:, last_name:, address:, postal_code: , city:, state:, country:,  user_defined1: nil, user_defined2: nil, user_defined3: nil, user_defined4: nil)
        attributes = {
          bin: bin,
          distributorcode: dc,
          cardstyle: style,
          companyname: sanitize(company_name),
          firstname: sanitize(first_name),
          lastname: sanitize(last_name),
          dateofbirth: incorporation_date,
          address1: sanitize(address),
          city: sanitize(city),
          county: sanitize(state),
          zipcode: postal_code,
          countrycode: sanitize(country),
        }
        attributes[:userdefined1] = user_defined1 if user_defined1
        attributes[:userdefined2] = user_defined2 if user_defined2
        attributes[:userdefined3] = user_defined3 if user_defined3
        attributes[:userdefined4] = user_defined4 if user_defined4

        response = client.post("/Account", attributes)
        Resources::Accounts::IssuedAccount.new(response, response.body[:data])
      end

      def info(account_id: )
        response = client.get("/Account/#{account_id}")
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

      private def sanitize(str)
        sanitizer = Resources::Sanitizer.new
        sanitizer.invoke(str)
      end
    end
  end
end
