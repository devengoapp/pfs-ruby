# frozen_string_literal: true

RSpec.describe PFS::Client do
  subject(:client) { described_class.new(username: "test", password: "test") }

  let(:uuid_regex) { /^[0-9a-fA-F]{8}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{4}\b-[0-9a-fA-F]{12}$/ }

  describe "login" do
    before do
      stub_request(:post, %r{/finac/api/Auth/Jwt$}).to_return(read_http_fixture("login/success.http"))
    end

    it "builds the correct request" do
      client.login!

      expect(WebMock).to have_requested(:post, %r{/finac/api/Auth/Jwt$})
        .with(headers: {
          "F-Origin" => /PFS.*Ruby Client/,
          "F-Message-ID" => uuid_regex,
          "Content-Type" => "application/json",
        })
    end

    it "returns the accounts" do
      token = client.login!

      expect(token).to be_a(PFS::Resources::Authentication::Token)
      expect(token).to respond_to(:access_token)
      expect(token).to respond_to(:expires_in)
    end
  end
end
