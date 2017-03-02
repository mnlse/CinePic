class CreatePeopleMovies < ActiveRecord::Migration
  def change
    create_table :people_movies do |t|
      t.integer :movie_id
      t.integer :person_id
      t.text :roles

      t.timestamps null: false
    end
  end
end
