# frozen_string_literal: true

module Transaction::Create
  def self.call(transaction:, account_id:, user_id:)
    Transaction.create(
      user_id:,
      account_id:,
      category: extract_category(transaction),
      date: extract_date(transaction),
      authorized_date: extract_authorized_date(transaction),
      name: extract_name(transaction),
      amount_cents: extract_amount(transaction),
      currency_code: extract_currency_code(transaction),
      plaid_transaction_id: extract_plaid_transaction_id(transaction),
      category_detailed: extract_personal_finance_detailed_category(transaction),
      category_primary: extract_personal_finance_primary_category(transaction),
      pending: extract_pending_status(transaction),
      pending_transaction_id: extract_pending_transaction_id(transaction),
      logo_url: extract_logo_url(transaction),
    )
  end

  def self.extract_category(transaction)
    transaction.category
  end

  def self.extract_personal_finance_detailed_category(transaction)
    transaction.personal_finance_category.detailed
  end

  def self.extract_personal_finance_primary_category(transaction)
    transaction.personal_finance_category.primary
  end

  def self.extract_date(transaction)
    transaction.date
  end

  def self.extract_authorized_date(transaction)
    transaction.authorized_date
  end

  def self.extract_name(transaction)
    transaction.merchant_name || transaction.name
  end

  def self.extract_amount(transaction)
    transaction.amount * 100
  end

  def self.extract_currency_code(transaction)
    transaction.iso_currency_code
  end

  def self.extract_plaid_transaction_id(transaction)
    transaction.transaction_id
  end

  def self.extract_pending_transaction_id(transaction)
    transaction.pending_transaction_id
  end

  def self.extract_pending_status(transaction)
    transaction.pending
  end

  def self.extract_logo_url(transaction)
    transaction.logo_url
  end
end
