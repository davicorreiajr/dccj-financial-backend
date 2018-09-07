class FixUserTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :account_id
    add_index :users, :email, unique: true
  end
end
