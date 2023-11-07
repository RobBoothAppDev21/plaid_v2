class AccountsController < ApplicationController
  before_action :plaid_client, only: %w[index show create]

  def index
    @accounts = Account.all
  end

  def show
  end

  # def create
  #   # access_tokens = current_user.items.map { |item| item.access_token }
  #   current_user.items.each do |item|
  #     accounts = @plaid_client.balances(item.access_token)
  #     Account::Create.call(accounts, item.id)
  #   end
  # end

  private

  def plaid_client
    @plaid_client ||= PlaidApi.new
  end
end
