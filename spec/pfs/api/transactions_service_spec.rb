# frozen_string_literal: true

RSpec.describe PFS::API::TransactionsService do
  subject(:transactions_service) { described_class.new(client) }

  let(:client) { PFS::Client.new(username: "test", password: "test", logger_enabled: false) }
  let(:account_id) { "200013353686" }

  describe "history" do
    context "with valid dates" do
      let(:start_date) { "2022-01-01" }
      let(:end_date) { "2022-01-02" }
      let(:transactions) { transactions_service.history(account_id: account_id, start_date: start_date, end_date: end_date) }

      before do
        stub_request(:post, %r{/finac/api/Auth/Jwt$}).to_return(read_http_fixture("login/success.http"))
        stub_request(:get, %r{/Transactions}).to_return(read_http_fixture("transactions/history/success.http"))
      end

      it "maps the attributes correctly" do
        expect(transactions).to be_a(PFS::Resources::Transactions::Transactions)
        expect(transactions.first).to be_a(PFS::Resources::Transactions::Transaction)
        expect(transactions.first.date).to eq("DATE")
        expect(transactions.first.amount).to eq("AMOUNT")
        expect(transactions.first.currency).to eq("CURRENCY")
        expect(transactions.first.available).to eq("AVAILABLE_BALANCE")
        expect(transactions.first.ledger).to eq("LEDGER_BALANCE")
        expect(transactions.first.transaction_origin).to eq("TRANSACTION_ORIGIN")
        expect(transactions.first.transaction_type).to eq("TRANSACTION_TYPE")
        expect(transactions.first.transaction_description).to eq("TRANSACTION_DESCRIPTION")
        expect(transactions.first.transaction_code_description).to eq("TRANSACTION_CODE_DESCRIPTION")
        expect(transactions.first.transaction_result).to eq("TRANSACTION_RESULT")
        expect(transactions.first.terminal_id).to eq("TERMINAL_ID")
        expect(transactions.first.terminal_location).to eq("TERMINAL_LOCATION")
        expect(transactions.first.terminal_owner).to eq("TERMINAL_OWNER")
        expect(transactions.first.terminal_city).to eq("TERMINAL_CITY")
        expect(transactions.first.terminal_state).to eq("TERMINAL_STATE")
        expect(transactions.first.terminal_country).to eq("TERMINAL_COUNTRY")
        expect(transactions.first.terminal_currency).to eq("TERMINAL_CURRENCY")
        expect(transactions.first.unique_reference).to eq("UNIQUE_REFERENCE")
        expect(transactions.first.card_type).to eq("CARD_TYPE")
        expect(transactions.first.mti).to eq("MTI")
        expect(transactions.first.arn).to eq("ARN")
        expect(transactions.first.stn).to eq("STN")
        expect(transactions.first.authentication_number).to eq("AUTHENTICATION_NUMBER")
        expect(transactions.first.record_type).to eq("RECORD_TYPE")
        expect(transactions.first.fee).to eq("FEE")
        expect(transactions.first.atm_fee).to eq("ATM_FEE")
        expect(transactions.first.issuer_fee).to eq("ISSUER_FEE")
        expect(transactions.first.foreign_exchange_fee).to eq("FOREIGN_EXCHANGE_FEE")
        expect(transactions.first.client_id).to eq("CLIENT_ID")
        expect(transactions.first.mcc).to eq("MCC")
        expect(transactions.first.surcharge).to eq("SURCHARGE")
        expect(transactions.first.response_code).to eq("RESPONSE_CODE")
        expect(transactions.first.original_transaction_amount).to eq("ORIGINAL_TRANSACTION_AMOUNT")
        expect(transactions.first.original_hold_amount).to eq("ORIGINAL_HOLD_AMOUNT")
        expect(transactions.first.conversion_rate).to eq(0)
        expect(transactions.first.card_acceptor_id_code).to eq("CARD_ACCEPTOR_ID_CODE")
        expect(transactions.first.action_code_description).to eq("ACTION_CODE_DESCRIPTION")
        expect(transactions.first.acquiring_institution).to eq("ACQUIRING_INSTITUTION")
        expect(transactions.first.processor).to eq("PROCESSOR")
        expect(transactions.first.pos_entry_mode).to eq("POS_ENTRY_MODE")
        expect(transactions.first.wallet_provider).to eq("WALLET_PROVIDER")
        expect(transactions.first.card_id).to eq("CARD_ID")
        expect(transactions.first.wallet_id).to eq("WALLET_ID")

      end
    end

    context "with invalid dates" do
      let(:start_date) { "FAKE" }
      let(:end_date) { "FAKE" }

      before do
        stub_request(:post, %r{/finac/api/Auth/Jwt$}).to_return(read_http_fixture("login/success.http"))
        stub_request(:get, %r{/Transactions}).to_return(read_http_fixture("transactions/history/invalid_dates.http"))
      end

      it "raises an error" do
        expected = expect do
          transactions_service.history(account_id: account_id,
                            start_date: start_date,
                            end_date: end_date)
        end
        expected.to raise_error(PFS::ClientError)
      end
    end
  end
end