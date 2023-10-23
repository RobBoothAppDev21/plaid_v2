class AddPlaidItemIdToItems < ActiveRecord::Migration[7.0]
  def up
    add_column :items, :plaid_item_id, :string
  end

  def down
    remove_column :items, :plaid_item_id
  end
end
