class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.references :item, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :plaid_id
      t.string :mask
      t.decimal :current_balance
      t.decimal :available_balance
      t.string :limit
      t.string :currency_code
      t.string :subtype
      t.string :type

      t.timestamps
    end
  end
end
