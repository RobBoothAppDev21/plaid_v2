# frozen_string_literal: true

class ItemsController < ApplicationController

  def index
    @items = Item.all
    @top_merchants = Transaction::GetTopMerchants.call
  end

  def create
    item_exchange_response = JSON.parse(params[:item_exchange_response])
    metadata = params[:metadata]
    item = Item::Create.call(item_exchange_response:, metadata:, user_id: current_user.id)

    if item&.valid?
      Account::FindNewAccounts.call(item)
      Transaction::FetchTransactions.call(item)
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
