# frozen_string_literal: true

module PlaidApi::GetBalances
  def self.call(item)
    client = PlaidApi::CreateClient.call
    access_token = item.access_token
    request = Plaid::AccountsBalanceGetRequest.new({ access_token: })
    response = client.accounts_balance_get(request)
    response.accounts
  end
end
