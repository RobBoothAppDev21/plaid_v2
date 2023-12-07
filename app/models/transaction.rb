class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :account

  # include OrderableByTimestamp
end
