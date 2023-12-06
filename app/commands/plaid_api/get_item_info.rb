# frozen_string_literal: true

module PlaidApi::GetItemInfo
  def self.call(item)
    client = create_plaid_client
    access_token = item.access_token

    request = Plaid::ItemGetRequest.new({ access_token: })
    client.item_get(request)
    # response = client.item_get(request)
    # item = response.item
    # status = response.status
  end

  def self.create_plaid_client
    PlaidApi::CreateClient.call
  end
end