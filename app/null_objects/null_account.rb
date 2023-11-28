# frozen_string_literal: true

class NullAccount

  def item_id
    NullItem.new
  end

  def plaid_id
    "NULL_PLAID_ID"
  end

  def mask
    "NULL_MASK"
  end

  def current_balance
    0
  end

  def available_balance
    0
  end

  def limit
    0
  end

  def currency_code
    "USD"
  end

  def account_subtype
    "NULL_ACCOUNT_SUBTYPE"
  end

  def account_type
    "NULL_ACCOUNT_TYPE"
  end

  def transactions
    []
  end
end