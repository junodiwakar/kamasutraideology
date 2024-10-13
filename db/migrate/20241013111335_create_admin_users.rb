class CreateAdminUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :admin_users do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.timestamps
    end
    add_index :admin_users, :email, unique: true
  end
end
