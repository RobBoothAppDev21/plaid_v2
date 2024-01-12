# frozen_string_literal: true

RSpec.describe Item::DeleteItem do

  def stub_plaid_item_remove
    stub_request(:post, "https://sandbox.plaid.com/item/remove")
      # .with(body: "{access_token: #{item.access_token}")
      # .to_return(status: 200, body: "", headers: {})
  end

  context "Item is deleted" do
    it "deletes item" do
      item = create(:item)
      stub_plaid_item_remove

      expect { described_class.call(item) }.to change { Item.count }.by(-1)
    end

    it "deletes associated accounts" do
      item = create(:item)
      account_1, account_2 = create_pair(:account, item:)
      stub_plaid_item_remove

      expect { described_class.call(item) }.to change { Account.count }.by(-2)
    end

    it "deletes associated transactions"
  end
end