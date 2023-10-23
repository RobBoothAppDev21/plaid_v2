class ItemsController < ApplicationController

  def create
    item_exchange_response = JSON.parse(params[:item_exchange_response])
    metadata = params[:metadata]
    plaid_item_id = item_exchange_response["item_id"]
    access_token = item_exchange_response["access_token"]
    bank_name = metadata["institution"]["name"]
    item = Item.new(
      user_id: current_user.id,
      access_token:,
      plaid_item_id: plaid_item_id,
      bank_name:,
    )

    render json: item
    # item.save
    # respond_to do |format|
    #   format.json { render json: {}}
    # end
  end

  private

  def item_params
    permit.require(:item).permit(:user_id, :access_token, :plaid_item_id, :bank_name)
  end
end
