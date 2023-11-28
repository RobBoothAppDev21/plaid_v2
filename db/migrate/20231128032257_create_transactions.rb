class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :account, null: false, foreign_key: true, type: :uuid
      t.string :category
      t.date :date
      t.date :authorized_date
      t.string :name
      t.decimal :amount
      t.string :currency_code, default: "USD"
      t.boolean :is_removed, default: false

      t.timestamps
    end
  end
end
