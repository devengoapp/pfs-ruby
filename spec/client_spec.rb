# frozen_string_literal: true

RSpec.describe PFS::Client do
  describe "initialization" do
    it "accepts :base_url option" do
      subject = described_class.new(base_url: "https://whatever.com")
      expect(subject.base_url).to eq("https://whatever.com")
    end

    it "defaults :base_url to production API" do
      subject = described_class.new
      expect(subject.base_url).to eq("https://api.prepaidfinancialservices.com/finac/api")
    end

    it "provides a default :origin" do
      subject = described_class.new
      expect(subject.origin).not_to be_empty
    end

    it "setup :username" do
      client = described_class.new(username: "username")
      expect(client.username).to eq("username")
    end

    it "setup :proxy" do
      client = described_class.new(proxy: "http://localhost:8080")
      expect(client.proxy).to eq("http://localhost:8080")
    end
  end

  describe "#get" do
    it "delegates to #request" do
      expect(subject).to receive(:execute).with(:get, "path", nil, foo: "bar").and_return(:returned)
      expect(subject.get("path", foo: "bar")).to eq(:returned)
    end
  end

  describe "#post" do
    it "delegates to #request" do
      expect(subject).to receive(:execute).with(:post, "path", { foo: "bar" }, {}).and_return(:returned)
      expect(subject.post("path", foo: "bar")).to eq(:returned)
    end
  end
end
