class RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    @rating.user_id = current_user.id
    @rating.movie_id = params[:movie_id]
    if @rating.save
      redirect_to articles_path
    else
      puts params
    end
  end
  private
  def rating_params
    params.require(:rating).permit(:rating, :thoughts)
  end
end
