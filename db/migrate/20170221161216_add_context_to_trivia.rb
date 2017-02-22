class AddContextToTrivia < ActiveRecord::Migration
  def change
    add_column :trivia, :context, :integer
  end
end
