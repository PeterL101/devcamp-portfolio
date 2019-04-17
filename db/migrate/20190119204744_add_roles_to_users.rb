class AddRolesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :roles, :string
    current_user.update_attribute :admin, true
  end
end
