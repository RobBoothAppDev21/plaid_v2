# frozen_string_literal: true

module Item::UpdateAccessToken
  def self.call(access_token:, item:)
    item.update(access_token:) unless access_token == "" || access_token.nil?
    Account::FindNewAccounts.call(item)
    Transaction::FetchTransactions.call(item)
  end
end
