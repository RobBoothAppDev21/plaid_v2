# frozen_string_literal: true

module Assets::GetAccounts
  ACCOUNT_TYPES = ["depository", "investment"].freeze

  def self.call(account_type: ACCOUNT_TYPES)
    Account::GetAccountsByType.call(account_type:)
  end

  def self.available_cash(account_type: "depository")
    deposit_accounts = call(account_type:)
    deposit_accounts.reduce(0) do |balance, account|
      balance += account.available_balance_cents
      balance
    end
  end

  def self.current_cash(account_type: "depository")
    deposit_accounts = call(account_type:)
    deposit_accounts.reduce(0) do |balance, account|
      balance += account.current_balance_cents
      balance
    end
  end

  def self.total_asset_value
    available_cash
  end
end
