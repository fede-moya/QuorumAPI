class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :ip
      t.string :user
      t.string :email
      t.boolean :status
      t.timestamps
    end
  end
end
