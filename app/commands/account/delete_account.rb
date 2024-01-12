# frozen_string_literal: true

module Account::DeleteAccount
  def self.call(account)
    unless account.transactions.empty?
      transactions = Transaction.where(account_id: account.id)
      transactions.each do |transaction|
        Transaction::DeleteTransaction.call(transaction)
      end
    end
    Account.delete(account)
  end
end