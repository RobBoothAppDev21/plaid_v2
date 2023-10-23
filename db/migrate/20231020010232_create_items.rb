class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :access_token

      t.timestamps
    end
  end
end
