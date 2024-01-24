# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Item::Create do

  def stub_plaid_metadata(**options)
    metadata = GeneratePlaidResponse.item_metadata(**options)
    JSON.parse(metadata)
  end

  def stub_public_token_exchange_response(**options)
    public_token_exchange_response = GeneratePlaidResponse.public_token_exchange_response(**options)
    JSON.parse(public_token_exchange_response)
  end

  context "Item cannot be created" do
    it "when bank already exists for current user" do
      user = create(:user)
      item = create(:item, user:)
      item_exchange_response = stub_public_token_exchange_response
      metadata = stub_plaid_metadata(institution_id: "BNK_01")

      expect { described_class.call(item_exchange_response:, metadata:, user_id: user.id) }
        .not_to change(Item, :count)
    end
  end

  context "Item is created" do
    it "when bank does not already exists for current user" do
      item_exchange_response = stub_public_token_exchange_response
      metadata = stub_plaid_metadata
      user = create(:user)

      expect { described_class.call(item_exchange_response:, metadata:, user_id: user.id) }
        .to change(Item, :count)
    end
  end
end