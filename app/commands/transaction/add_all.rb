# frozen_string_literal: true

module Transaction::AddAll
  def self.call(added:, item_id:, user_id:)
    added.each do |transaction|
      next if Transaction.exists?(plaid_transaction_id: transaction.transaction_id, user_id:)

      account_id = retrieve_account_id(transaction, item_id)
      Transaction::Create.call(transaction:, account_id:, user_id:)
    end
  end

  def self.retrieve_account_id(transaction, item_id)
    account = Account.find_by(id: transaction.account_id, item_id:)
    account.id
  end
end
