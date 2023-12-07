# frozen_string_literal: true

class NullItem

  def user_id
    NullUser.new
  end

  def access_token
    "null_access_token"
  end

  def plaid_item_id
    "null_plaid_item_id"
  end

  def transactions_cursor
    "null_transaction_cursor"
  end

  def is_active
    false
  end

  def accounts
    []
  end
end