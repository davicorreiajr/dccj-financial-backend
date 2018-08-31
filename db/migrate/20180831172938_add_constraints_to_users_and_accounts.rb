class AddConstraintsToUsersAndAccounts < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :account_id, false
    change_column_null :accounts, :balance, false
    change_column_null :accounts, :user_id, false
  end
end
