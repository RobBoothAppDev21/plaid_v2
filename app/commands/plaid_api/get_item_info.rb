# frozen_string_literal: true

module PlaidApi::GetItemInfo
  def self.call(item)
    client = PlaidApi::CreateClient.call
    access_token = item.access_token

    request = Plaid::ItemGetRequest.new({ access_token: })
    client.item_get(request)
  end
end
