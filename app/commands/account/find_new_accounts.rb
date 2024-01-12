# frozen_string_literal: true

module Account::FindNewAccounts
  def self.call(item)
    accounts = PlaidApi::GetBalances.call(item)
    accounts.each do |account|
      next if existing_account?(account, item)

      Account::Create.call(account, item.id)
    end
  end

  def self.existing_account?(account, item)
    Account.exists?(item_id: item.id, name: account.name)
  end
end
