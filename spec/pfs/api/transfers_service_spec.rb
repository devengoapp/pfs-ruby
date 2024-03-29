# frozen_string_literal: true

RSpec.describe PFS::API::TransfersService, :unit, type: :client do
  subject(:transfers) { described_class.new(client) }

  let(:client) { instance_double(PFS::Client) }
  let(:response) { OpenStruct.new(body: { data: {} }) }
  let(:options) { {} }

  before do
    allow(client).to receive(:post).and_return(response).once

    @transfer = transfers.create(
      "account_id",
      "currency",
      "amount",
      "destination",
      "destination_id",
      "country",
      "first_name",
      "last_name",
      options
    )
  end

  it "creates the transfer" do
    expect(@transfer).to be_a PFS::Resources::Transfers::Transfer
  end

  it "calls to the endpoint" do
    expect(client).to have_received(:post).once do |param, data|
      expect(param).to eq "/BankPayment/account_id/OneOffPayment"
      expect(data).to match({
        accountidentifier: "destination",
        bankidentifier: "destination_id",
        countrycode: "country",
        currency: "currency",
        firstname: "first_name",
        lastname: "last_name",
        paymentamount: "amount",
      })
    end
  end

  context "with an instant option" do
    let(:options) { { instant: true } }

    it "sends the isinstant param" do
      expect(client).to have_received(:post).once do |param, data|
        expect(param).to eq "/BankPayment/account_id/OneOffPayment"
        expect(data).to include({
          accountidentifier: "destination",
          bankidentifier: "destination_id",
          countrycode: "country",
          currency: "currency",
          firstname: "first_name",
          lastname: "last_name",
          paymentamount: "amount",
          isinstant: true,
        })
      end
    end
  end

  context "with a reference option" do
    let(:options) { { reference: "reference" } }

    it "sends the reference param" do
      expect(client).to have_received(:post).once do |param, data|
        expect(param).to eq "/BankPayment/account_id/OneOffPayment"
        expect(data).to include({
          accountidentifier: "destination",
          bankidentifier: "destination_id",
          countrycode: "country",
          currency: "currency",
          firstname: "first_name",
          lastname: "last_name",
          paymentamount: "amount",
          reference: "reference",
        })
      end
    end
  end

  context "with a user defined fields option" do
    let(:options) { { user_defined_fields: { key: "value" } } }

    it "sends the reference param" do
      expect(client).to have_received(:post).once do |param, data|
        expect(param).to eq "/BankPayment/account_id/OneOffPayment"
        expect(data).to include({
          accountidentifier: "destination",
          bankidentifier: "destination_id",
          countrycode: "country",
          currency: "currency",
          firstname: "first_name",
          lastname: "last_name",
          paymentamount: "amount",
          userdefinedfields: { key: "value" },
        })
      end
    end
  end

  context "with a unstructuredreference option" do
    let(:options) { { unstructured_reference: "unstructuredreference" } }

    it "sends the unstructuredreference param" do
      expect(client).to have_received(:post).once do |param, data|
        expect(param).to eq "/BankPayment/account_id/OneOffPayment"
        expect(data).to include({
          accountidentifier: "destination",
          bankidentifier: "destination_id",
          countrycode: "country",
          currency: "currency",
          firstname: "first_name",
          lastname: "last_name",
          paymentamount: "amount",
          unstructuredreference: "unstructuredreference",
        })
      end
    end
  end
end
