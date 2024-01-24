# frozen_string_literal: true

module PlaidApi::RemoveItem
  def self.call(item)
    access_token = item.access_token
    client = PlaidApi::CreateClient.call
    request = Plaid::ItemRemoveRequest.new({ access_token: })
    response = client.item_remove(request)
  end
end