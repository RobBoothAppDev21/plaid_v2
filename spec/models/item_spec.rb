# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  context "should validate" do
    it "with access_token, plaid_item_id, bank_name, institution_id" do
      item = build(:item)
      expect(item).to be_valid
    end
  end

  context "should not validate" do
    it "when access_token is not present" do
      item = build(:item, access_token: "")
      expect(item).not_to be_valid
    end

    it "when plaid_item_id is not present" do
      item = build(:item, plaid_item_id: "")
      expect(item).not_to be_valid
    end

    it "when bank_name is not present" do
      item = build(:item, bank_name: "")
      expect(item).not_to be_valid
    end

    it "when institution_id is not present" do
      item = build(:item, institution_id: "")
      expect(item).not_to be_valid
    end
  end
end
