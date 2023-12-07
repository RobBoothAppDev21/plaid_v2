# frozen_string_literal: true

module Account::Create
  def self.call(account, item_id)
    Account.create(
      item_id:,
      name: extract_account_name(account),
      plaid_account_id: extract_account_id(account),
      mask: extract_account_mask(account),
      current_balance_cents: extract_current_balance(account),
      available_balance_cents: extract_available_balance(account),
      limit_cents: extract_account_limit(account),
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
    return 0 if account.balances.available.nil?

    account.balances.available * 100
  end

  def self.extract_current_balance(account)
    return 0 if account.balances.current.nil?

    account.balances.current * 100
  end

  def self.extract_currency_code(account)
    account.balances.iso_currency_code
  end

  def self.extract_account_limit(account)
    return 0 if account.balances.limit.nil?

    account.balances.limit * 100
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
