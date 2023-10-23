class DropPortfolios < ActiveRecord::Migration[7.0]
  def change
    drop_table :portfolios
  end
end
