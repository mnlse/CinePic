class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :surname
      t.date :date_of_birth
      t.string :place_of_birth
      t.text :bio
      t.string :martial_status
      t.integer :height
      t.text :nicknames

      t.timestamps null: false
    end
  end
end
