class AccountsController < ApplicationController
  # before_action :plaid_client, only: %w[index show create]

  def index
    @accounts = Item.find_by_id(params[:item_id]).accounts
    render "index", status: :ok
  end

  def show
    @account = Account.find(params[:id])
  end
end
