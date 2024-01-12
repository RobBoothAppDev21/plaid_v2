# frozen_string_literal: true

module PlaidApi::ExchangePublicToken
  def self.call(public_token)
    client = PlaidApi::CreateClient.call
    request = Plaid::ItemPublicTokenExchangeRequest.new
    request.public_token = public_token

    client.item_public_token_exchange(request)
  end
end