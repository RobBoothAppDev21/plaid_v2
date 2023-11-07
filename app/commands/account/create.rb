# frozen_string_literal: true

module Account::Create
  def self.call(account, item_id)
    Account.create(
      item_id:,
      name: extract_account_name(account),
      plaid_id: extract_account_id(account),
      mask: extract_account_mask(account),
      current_balance: extract_current_balance(account),
      available_balance: extract_available_balance(account),
      limit: extract_account_limit(account),
      currency_code: extract_currency_code(account),
      account_subtype: extract_account_subtype(account),
      account_type: extract_account_type(account),
    )
  end

  def self.extract_account_name(account)
    account.name
  end

  def self.extract_official_account_name(account)
    account.official_name
  end

  def self.extract_account_id(account)
    account.account_id
  end

  def self.extract_available_balance(account)
    account.balances.available * 100
  end

  def self.extract_current_balance(account)
    account.balances.current * 100
  end

  def self.extract_currency_code(account)
    account.balances.iso_currency_code
  end

  def self.extract_account_limit(account)
    account.balances.limit
  end

  def self.extract_account_mask(account)
    account.mask
  end

  def self.extract_account_subtype(account)
    account.subtype
  end

  def self.extract_account_type(account)
    account.type
  end
end
