# frozen_string_literal: true

module Account::GetAccountsByType
  ACCOUNT_TYPES = ["depository", "credit", "loan", "investment", "other"]
  
  def self.call(account_type: ACCOUNT_TYPES)
    Account.where(account_type:)
  end
end