class AddIsGuestToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_guest, :boolean, default: false
  end
end
