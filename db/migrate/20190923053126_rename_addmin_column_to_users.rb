class RenameAddminColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :addmin, :admin
  end
end
