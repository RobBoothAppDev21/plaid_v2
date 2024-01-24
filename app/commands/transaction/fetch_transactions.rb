# frozen_string_literal: true

module Transaction::FetchTransactions
  def self.call(item)
    # client = PlaidApi::CreateClient.call
    PlaidApi::GetTransactions.call(item)
  end
end
