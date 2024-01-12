# frozen_string_literal: true

module Liabilities::GetAccounts
  ACCOUNT_TYPES = ["credit", "loan"].freeze

  def self.call(account_type: ACCOUNT_TYPES)
    Account::GetAccountsByType.call(account_type:)
  end

  def self.credit_cards_balance(account_type: "credit")
    deposit_accounts = call(account_type:)
    deposit_accounts.reduce(0) do |balance, account|
      balance += account.current_balance
      balance
    end
  end

  def self.loans_balance(account_type: "loan")
    deposit_accounts = call(account_type:)
    deposit_accounts.reduce(0) do |balance, account|
      balance += account.current_balance
      balance
    end
  end

  def self.total_liabilities_value
    credit_cards_balance + loans_balance
  end
end
