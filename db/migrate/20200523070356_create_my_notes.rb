class CreateMyNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :my_notes do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description, null: false

      t.timestamps
    end
  end
end
