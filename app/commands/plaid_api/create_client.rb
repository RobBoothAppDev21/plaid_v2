# frozen_string_literal: true

module PlaidApi::CreateClient
  def self.call
    configuration = PlaidApi::Configure.call
    api_client = Plaid::ApiClient.new(configuration)
    Plaid::PlaidApi.new(api_client)
  end
end