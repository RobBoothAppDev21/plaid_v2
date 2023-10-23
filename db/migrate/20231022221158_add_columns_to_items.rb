class AddColumnsToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :bank_name, :string
    add_column :items, :transactions_cursor, :string
    add_column :items, :is_active, :boolean
  end
end
