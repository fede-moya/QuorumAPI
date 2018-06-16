class AddDefaultFalseToUserStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :status, :boolean, default: false
  end
end
