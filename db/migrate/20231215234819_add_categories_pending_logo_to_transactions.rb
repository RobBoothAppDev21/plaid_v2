class AddCategoriesPendingLogoToTransactions < ActiveRecord::Migration[7.0]
  def up
    change_table(:transactions) do |t|
      t.string :category_detailed, :category_primary, :pending_transaction_id, :logo_url
      t.boolean :pending
    end
  end

  def down
    change_table(:transactions) do |t|
      t.remove :category_detailed, :category_primary, :pending_transaction_id, :logo_url, :pending
    end
  end
end
