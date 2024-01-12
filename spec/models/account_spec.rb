# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  context "should validate" do
    it "with name, plaid_account_id, mask, currency_code, subtype, type, current_balance_cents, available_balance_cents, limit_cents" do
      account = create(:account)
      expect(account).to be_valid
    end
  end

  context "monetize currency attributes" do
    it "monetizes current_balance_cents" do
      account = build(:account)
      expect(account).to monetize(:current_balance_cents)
    end

    it "monetizes available_balance_cents" do
      account = build(:account)
      expect(account).to monetize(:available_balance_cents)
    end

    it "monetizes limit_cents" do
      account = build(:account)
      expect(account).to monetize(:limit_cents)
    end
  end

  context "should not be valid" do
    it "when name is not present" do
      account = build(:account, name: nil)
      expect(account).not_to be_valid
    end

    it "when plaid_account_id is not present" do
      account = build(:account, plaid_account_id: nil)
      expect(account).not_to be_valid
    end

    it "when mask is not present" do
      account = build(:account, mask: nil)
      expect(account).not_to be_valid
    end

    it "when currency_code is not present" do
      account = build(:account, currency_code: nil)
      expect(account).not_to be_valid
    end

    it "when subtype is not present" do
      account = build(:account, subtype: nil)
      expect(account).not_to be_valid
    end
    it "when type is not present" do
      account = build(:account, type: nil)
      expect(account).not_to be_valid
    end

    it "when current_balance_cents is not present" do
      account = build(:account, current_balance_cents: nil)
      expect(account).not_to be_valid
    end

    it "when available_balance_cents is not present" do
      account = build(:account, available_balance_cents: nil)
      expect(account).not_to be_valid
    end

    it "when limit_cents is not present" do
      account = build(:account, limit_cents: nil)
      expect(account).not_to be_valid
    end
  end
end
