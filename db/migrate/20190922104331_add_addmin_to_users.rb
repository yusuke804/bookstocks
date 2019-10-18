class AddAddminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :addmin, :boolean, default: false, null: false
  end
end
