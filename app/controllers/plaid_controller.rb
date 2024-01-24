class PlaidController < ApplicationController

  def create_link_token
    client = PlaidApi::CreateClient.call
    @link_token = PlaidApi::CreateLinkToken.call(client, current_user)
    render json: @link_token
  end

  def public_token_exchange
    public_token = params[:public_token]
    access_token = PlaidApi::ExchangePublicToken.call(public_token)
    render json: access_token
  end
end
