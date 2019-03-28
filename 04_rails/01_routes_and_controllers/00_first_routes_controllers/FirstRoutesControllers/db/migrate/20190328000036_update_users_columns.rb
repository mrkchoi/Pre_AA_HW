class UpdateUsersColumns < ActiveRecord::Migration[5.2]
  def change
    # add_column :users, :username
    remove_column :users, :name
    remove_column :users, :email
  end
end
