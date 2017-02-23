class CreateSlideshows < ActiveRecord::Migration
  def change
    create_table :slideshows do |t|
      t.integer :destination_id
      t.integer :destination_type
    end
  end
end
