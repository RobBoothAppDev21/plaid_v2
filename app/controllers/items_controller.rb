class ItemsController < ApplicationController

  def create
    item_exchange_response = JSON.parse(params[:item_exchange_response])
    metadata = params[:metadata]
    item = Item::Create.call(item_exchange_response, metadata, user: current_user)

    if item&.valid?
      Account::FindNewAccounts.call(item)
      redirect_to root_path
    else
      flash.now[:alert] = "Something went wrong"
    end
  end

  private

  def item_params
    permit.require(:item).permit(:user_id, :access_token, :plaid_item_id, :bank_name)
  end
end
