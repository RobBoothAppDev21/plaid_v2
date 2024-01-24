# frozen_string_literal: true

namespace :data_migrations do
  desc "Update account columns from decimal data type to integer"
  task account_decimal_to_integer: [:environment] do
    Account.all.each do |account|
      account_decimal_to_integer(account)
    end
  end

  desc "Update transaction columns from decimal data type to integer"
  task transaction_decimal_to_integer: [:environment] do
    Transaction.all.each do |transaction|
      transaction_decimal_to_integer(transaction)
    end
  end

  def account_decimal_to_integer(account)
    current_balance_as_integer = account.current_balance.to_f.to_i
    available_balance_as_integer = account.available_balance.to_f.to_i
    limit_as_integer = account.limit.to_f.to_i
    account.update!(
      current_balance_cents: current_balance_as_integer,
      available_balance_cents: available_balance_as_integer,
      limit_cents: limit_as_integer,
    )
  end

  def transaction_decimal_to_integer(transaction)
    amount_as_integer = (transaction.amount.to_f * 100).to_i
    transaction.update!(amount_cents: amount_as_integer)
  end
end
