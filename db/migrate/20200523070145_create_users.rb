class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :password_reset_token
      t.string :image_url

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, [:first_name, :last_name]
  end
end
