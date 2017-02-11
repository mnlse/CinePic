class AddDetailsToMovies < ActiveRecord::Migration

  def change
    add_column :movies, :ratingcounter, :integer
    add_column :movies, :avgrating, :integer
    add_column :movies, :yt_trailer_url, :string
  end

end
