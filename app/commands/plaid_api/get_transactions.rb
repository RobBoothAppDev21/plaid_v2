# frozen_string_literal: true

module PlaidApi::GetTransactions
  def self.call(item)
    # binding.break
    client = PlaidApi::CreateClient.call
    cursor = extract_cursor(item)
    access_token = extract_access_token(item)
    added = []
    modified = []
    removed = []
    has_more = true

    while has_more
      request = Plaid::TransactionsSyncRequest.new(
        {
          access_token:,
          cursor:,
          options: { include_personal_finance_category: true },
        },
      )
      response = client.transactions_sync(request)

      added += response.added
      modified += response.modified
      removed += response.removed
      has_more = response.has_more
      cursor = response.next_cursor
    end
    transactions_cursor = cursor
    Transaction::UpdateAll.call(item:, added:, modified:, removed:, transactions_cursor:)
  end

  def self.extract_access_token(item)
    item.access_token
  end

  def self.extract_cursor(item)
    item.transactions_cursor
  end
end
