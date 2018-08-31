class AddAccountIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :account_id, :integer

    add_foreign_key :users, :accounts
  end
end
