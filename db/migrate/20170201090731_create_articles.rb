class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :author
      t.boolean :approved

      t.timestamps null: false
    end
  end
end
