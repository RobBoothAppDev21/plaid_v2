# frozen_string_literal: true

module Account::FindNewAccounts
  def self.call(item)
    accounts = plaid_client.balances(item.access_token)
    accounts.each do |account|
      next if existing_account?(account, item)

      Account::Create.call(account, item.id)
    end
  end

  def self.existing_account?(account, item)
    Account.exists?(item_id: item.id, plaid_id: account.account_id)
  end

  def self.plaid_client
    @plaid_client ||= PlaidApi.new
  end
end
