class AccountsController < ApplicationController
  before_action :plaid_client, only: %w[index show create]

  def index
    @accounts = Account.all
  end

  def show
  end

  def create
    access_token = current_user.items.first.access_token
    accounts = @plaid_client.balances(access_token)
    binding.break
  end

  private

  def plaid_client
    @plaid_client ||= PlaidApi.new
  end
end
