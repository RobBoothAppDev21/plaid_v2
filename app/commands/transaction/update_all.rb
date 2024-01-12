# frozen_string_literal: true

module Transaction::UpdateAll
  def self.call(item:, added:, modified:, removed:, transactions_cursor:)
    item_id = item.id
    user_id = find_user(item_id).id
    Transaction::AddAll.call(added:, item_id:, user_id:)
    Item::UpdateCursor.call(item:, transactions_cursor:)
    # Transaction::ModifyAll.call(item_id, modified)
    # Transaction::RemoveAll.call(item_id, removed)
  end

  def self.find_user(item_id)
    Item.find(item_id).user
  end
end
