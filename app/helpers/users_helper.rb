module UsersHelper
  def find_cover_img(movie_id)
    @movie = Movie.find(movie_id)
    @movie.cover_img.url(:show_page)
  end
end
