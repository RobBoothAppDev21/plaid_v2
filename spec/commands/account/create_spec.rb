# frozen_string_literal: true

RSpec.describe Account::Create do

  def create_plaid_account_response
    GeneratePlaidResponse.plaid_account_object
  end

  context "account is created" do
    it "creates a new account" do
      item = create(:item)
      account_object = create_plaid_account_response

      expect { described_class.call(account_object, item.id) }.to change { Account.count }.by(1)
    end
  end
end