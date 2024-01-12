#frozen_string_literal: true

module Transaction::DeleteTransaction
  def self.call(transaction)
    Transaction.delete(transaction)
  end
end