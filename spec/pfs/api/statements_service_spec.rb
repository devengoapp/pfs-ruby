# frozen_string_literal: true

RSpec.describe PFS::API::StatementsService do
  subject(:statements) { described_class.new(client) }

  let(:client) { PFS::Client.new(username: "test", password: "test", logger_enabled: false) }
  let(:account_id) { "200013353686" }
  let(:inward_outward) { 1 }
  let(:processor) { 1 }

  describe "by_id" do
    context "with a valid Statement ID" do
      let(:statement_id) { "16351705" }
      let(:statement) { statements.by_id(account_id: account_id, statement_id: statement_id, inward_outward: inward_outward, processor: processor) }

      before do
        stub_request(:post, %r{/finac/api/Auth/Jwt$}).to_return(read_http_fixture("login/success.http"))
        stub_request(:get, %r{/StatementById}).to_return(read_http_fixture("statements/by_id/success.http"))
      end

      it "maps the attributes correctly" do
        expect(statement).to be_a(PFS::Resources::Statements::Statement)
        expect(statement.id).to eq(16_351_705)
        expect(statement.transaction_id).to eq("PFSTXd1a12bd224d7453faeabcd1c5a88ff")
        expect(statement.amount).to eq(0.1)
        expect(statement.cardholder_id).to eq(account_id)
        expect(statement.debtor_bank_identifier).to eq("PFSSESM1")
        expect(statement.debtor_account_identifier).to eq("ES7467130002590013353686")
        expect(statement.debtor_full_name).to eq("ESB95389672 LINKING PATHS")
        expect(statement.debtor_full_address).to eq("ARRANDI 33 5C NOTPROVIDED")
        expect(statement.debtor_country_code).to eq("ES")
        expect(statement.creditor_bank_identifier).to eq("CLPEES2MXXX")
        expect(statement.creditor_account_identifier).to eq("ES6930350016560160061541")
        expect(statement.creditor_full_name).to eq("Aitor Garcia")
        expect(statement.creditor_full_address).to eq("NOTPROVIDED NOTPROVIDED")
        expect(statement.creditor_country_code).to eq("ES")
        expect(statement.reference).to eq("X17")
        expect(statement.entered_at).to eq("2022-09-01T15:12:43.240Z")
        expect(statement.inward_outward).to eq(1)
        expect(statement.processor_type).to eq(1)
        expect(statement.status).to eq("ACCP")
        expect(statement.user_defined_fields).to include(key: "value", transfer_external_id: "tra_ca_tra")
      end
    end

    context "with an invalid Statement ID" do
      let(:statement_id) { "FAKE" }

      before do
        stub_request(:post, %r{/finac/api/Auth/Jwt$}).to_return(read_http_fixture("login/success.http"))
        stub_request(:get, %r{/StatementById}).to_return(read_http_fixture("statements/by_id/invalid_id.http"))
      end

      it "raises an error" do
        expected = expect do
          statements.by_id(account_id: account_id,
                           statement_id: statement_id,
                           inward_outward: inward_outward,
                           processor: processor)
        end
        expected.to raise_error(Faraday::Error)
      end
    end
  end
end
