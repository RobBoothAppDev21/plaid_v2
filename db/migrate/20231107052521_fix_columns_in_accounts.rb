class FixColumnsInAccounts < ActiveRecord::Migration[7.0]
  def up
    rename_column :accounts, :type, :account_type
    rename_column :accounts, :subtype, :account_subtype
  end

  def down
    rename_column :accounts, :account_type, :type
    rename_column :accounts, :account_subtype, :subtype
  end
end
