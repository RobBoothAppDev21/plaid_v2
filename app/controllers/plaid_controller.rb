class PlaidController < ApplicationController
  before_action :plaid_client

  def create_link_token
    @link_token = @plaid_client.link_token(current_user)
    render json: @link_token
    # respond_to do |format|
    #   format.json { render json: JSON.parse(link_token) }
    # end
  end

  def public_token_exchange
    public_token = params[:public_token]
    access_token = @plaid_client.public_token_exchange(public_token)
    render json: access_token
  end

  private

  def plaid_client
    @plaid_client ||= PlaidApi.new
  end
end
