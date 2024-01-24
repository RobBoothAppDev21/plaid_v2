# frozen_string_literal: true

class Account < ApplicationRecord
  belongs_to :item
  has_many :transactions, dependent: :destroy

  validates :name, :plaid_account_id, :mask, :currency_code, :account_subtype, :account_type,
            :current_balance_cents, :available_balance_cents, :limit_cents, presence: true
  # has_many :transactions, -> { order("authorized_date desc") }, dependent: :destroy

  monetize :current_balance_cents, :available_balance_cents, :limit_cents
end
