# frozen_string_literal: true

RSpec.describe PFS::Resources::Collection do
  let(:response) { { data: [ { id: 1 }, { id: 2 }] }.to_json }
  let(:item_klass) { double }

  before do
    allow(item_klass).to receive(:new)
  end

  context "with attributes_collection" do
    subject(:collection) { PFS::Resources::Collection.new(response, item_klass, [{ id: 1 }, { id: 2 }]) }

    it "initialize object collection with test attributes" do
      expect(collection.response).to eql(response)
      expect(item_klass).to have_received(:new).with(nil, { id: 1 }).once
      expect(item_klass).to have_received(:new).with(nil, { id: 2 }).once
    end
  end

  context "without attributes_collection" do
    subject(:collection) { PFS::Resources::Collection.new(response, item_klass) }

    it "initialize object collection with nil attributes" do
      expect(collection.response).to eql(response)
      expect(item_klass).not_to have_received(:new)
    end
  end
end
