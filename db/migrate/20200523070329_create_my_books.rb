class CreateMyBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :my_books do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :author, null: false
      t.string :genre
      t.string :isbn
      t.integer :categories, null: false

      t.timestamps
    end
  end
end
