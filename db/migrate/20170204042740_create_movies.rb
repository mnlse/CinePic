class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :actors
      t.string :genres
      t.string :writers
      t.integer :runtime
      t.string :director

      t.timestamps null: false
    end
  end
end
