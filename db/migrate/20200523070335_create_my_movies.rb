class CreateMyMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :my_movies do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :genre
      t.string :released_date
      t.integer :categories, null: false

      t.timestamps
    end
  end
end
