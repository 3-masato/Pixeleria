class AddUniqueIndexToUsersAccountName < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :account_name, unique: true
  end
end
