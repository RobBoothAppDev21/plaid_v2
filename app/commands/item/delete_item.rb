#frozen_string_literal: true

module Item::DeleteItem
  def self.call(item)
    accounts = Account.where(item_id: item.id)
    accounts.each do |account|
      Account::DeleteAccount.call(account)
    end
    Item.delete(item)
    PlaidApi::RemoveItem.call(item)
  end
end
