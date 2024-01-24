# frozen_string_literal: true

module PlaidApi::GetLinkTokenRequest
  def self.call(link_token)
    client = PlaidApi::CreateClient.call
    request = Plaid::LinkTokenGetRequest.new({ link_token: })
    client.link_token_get(request)
  end
end