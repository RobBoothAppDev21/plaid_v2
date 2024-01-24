# frozen_string_literal: true

module Assets::GetAccounts
  ACCOUNT_TYPES = ["depository", "investment"].freeze

  def self.call(account_type: ACCOUNT_TYPES)
    Account::GetAccountsByType.call(account_type:)
  end

  def self.available_cash(account_type: "depository")
    deposit_accounts = call(account_type:)
    deposit_accounts.sum(&:available_balance)
  end

  def self.current_cash(account_type: "depository")
    deposit_accounts = call(account_type:)
    deposit_accounts.sum(&:current_balance)
  end

  def self.investments_balance(account_type: "investment")
    deposit_accounts = call(account_type:)
    deposit_accounts.sum(&:current_balance)
  end

  def self.total_asset_value
    available_cash + investments_balance
  end
end
