# frozen_string_literal: true

class ItemsController < ApplicationController

  def index
    @items = current_user.items
    @top_merchants = Transaction::GetTopMerchants.call
    @cash_balance = Assets::GetAccounts.available_cash
    @total_asset_value = Assets::GetAccounts.total_asset_value
    @investments_balance = Assets::GetAccounts.investments_balance
    @total_liabilities_value = Liabilities::GetAccounts.total_liabilities_value
    @credit_cards_balance = Liabilities::GetAccounts.credit_cards_balance
    @loans_balance = Liabilities::GetAccounts.loans_balance
    @spend_by_category = Transaction::GetSpendByCategory.call
    @networth = Networth::CalculateNetworth.call
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

  def destroy
    item = Item.find(params[:id])
    Item::DeleteItem.call(item)
    redirect_to root_path
  end

  private

  def item_params
    permit.require(:item).permit(:user_id, :access_token, :plaid_item_id, :bank_name)
  end
end
