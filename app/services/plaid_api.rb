# frozen_string_literal: true

class PlaidApi
  attr_reader :client

  def initialize
    configuration = Plaid::Configuration.new
    configuration.server_index = Plaid::Configuration::Environment["sandbox"]
    configuration.api_key["PLAID-CLIENT-ID"] = Rails.application.credentials.plaid[:client_id]
    configuration.api_key["PLAID-SECRET"] = Rails.application.credentials.plaid[:sandbox][:secret]

    api_client = Plaid::ApiClient.new(configuration)

    @client = Plaid::PlaidApi.new(api_client)
  end

  def link_token(user)
    client_user_id = user.id

    link_token_create_request = Plaid::LinkTokenCreateRequest.new({
      user: { client_user_id: client_user_id.to_s },
      client_name: "My app",
      products: ["auth", "transactions"],
      country_codes: ["US"],
      language: "en",
    })

    link_token_response = client.link_token_create(link_token_create_request)
    link_token_response.link_token
  end

  def public_token_exchange(public_token)
    request = Plaid::ItemPublicTokenExchangeRequest.new
    request.public_token = public_token

    client.item_public_token_exchange(request)
  end

  def remove_item(access_token)
    item_remove_request = Plaid::ItemRemoveRequest.new
    item_reomve_request.access_token = access_token

    client.item_remove(item_remove_request)
  end

  def authentication(access_token)
    auth_get_request = Plaid::AuthGetRequest.new
    auth_get_request.access_token = access_token

    auth_response = client.auth_get(auth_get_request)
    auth_response.auth
  end

  def balances(access_token)
    request = Plaid::AccountsBalanceGetRequest.new({ access_token: access_token})
    response = client.accounts_balance_get(request)
    response.accounts
  end

  def transactions(access_token)
    transactions_sync_request = Plaid::TransactionsSyncRequest.new
    transactions_sync_request.access_token = access_token
    transaction_response = client.transactions_sync(transactions_sync_request)
    transactions = transaction_response.added

    while transaction_response.has_more
      transactions_sync_request = Plaid::TransactionsSyncRequest.new
      transactions_sync_request.access_token = access_token
      transactions_sync_request.cursor = transaction_response.next_cursor

      transaction_response = client.transactions_sync(transactions_sync_request)
      transactions += transaction_response.added
    end
    transactions
  end
end
