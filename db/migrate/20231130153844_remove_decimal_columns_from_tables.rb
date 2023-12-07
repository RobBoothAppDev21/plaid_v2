class RemoveDecimalColumnsFromTables < ActiveRecord::Migration[7.0]
  def up
    change_table(:accounts) do |t|
      t.remove :current_balance, :available_balance, :limit
    end

    remove_column :transactions, :amount
  end

  def down
    change_table(:accounts) do |t|
      t.decimal :current_balance, :available_balance, :limit
    end

    add_column :transactions, :amount, :decimal
  end
end
