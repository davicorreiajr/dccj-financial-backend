class AddConstraintsToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :account_id, :integer, null: false
    add_foreign_key :transactions, :accounts

    change_column_null :transactions, :value, false
  end
end
