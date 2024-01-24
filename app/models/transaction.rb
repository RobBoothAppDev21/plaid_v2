class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :account

  monetize :amount_cents

  # include OrderableByTimestamp
end
