class DropSlideshowsTable < ActiveRecord::Migration
  def change
    def up
      drop_table :slideshows
    end

    def down
      raise ActiveRecord::IrreversibleMigration
    end
  end
end
