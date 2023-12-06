# frozen_string_literal: true

module PlaidApi::CreateLinkToken
  def self.call(client, user)
    client_user_id = user.id

    link_token_create_request = Plaid::LinkTokenCreateRequest.new(
      {
        user: { client_user_id: client_user_id.to_s },
        client_name: "My app",
        products: ["auth", "transactions"],
        country_codes: ["US"],
        language: "en",
      },
    )

    link_token_response = client.link_token_create(link_token_create_request)
    link_token_response.link_token
  end
end