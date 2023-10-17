class CreatePortfolios < ActiveRecord::Migration[7.0]
  def change
    enable_extension "pgcrypto"
  end

  def change
    create_table :portfolios, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
