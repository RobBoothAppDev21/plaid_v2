# frozen_string_literal: true

module Item::UpdateCursor
  def self.call(item:, transactions_cursor:)
    item_id = item.id
    Item.update!(item_id, transactions_cursor:)
  end
  # def self.call(item_id, **options)
  #   Item.find(item_id).update!(options)
  # end
end
