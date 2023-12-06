class AddColumnsToTables < ActiveRecord::Migration[7.0]
  def up
    add_column :items, :institution_id, :string

    change_table(:transactions) do |t|
      t.column :plaid_transaction_id, :string
      t.column :amount_cents, :integer, default: 0
    end

    change_table(:accounts) do |t|
      t.integer :current_balance_cents, :available_balance_cents, :limit_cents, default: 0
      t.rename :plaid_id, :plaid_account_id
    end
  end

  def down
    remove_column :items, :institution_id

    change_table(:transactions) do |t|
      t.remove :plaid_transaction_id
      t.remove :amount_cents
    end

    change_table(:accounts) do |t|
      t.remove :current_balance_cents, :available_balance_cents, :limit_cents
      t.rename :plaid_account_id, :plaid_id
    end
  end
end
