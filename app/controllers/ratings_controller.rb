class RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    @rating.user_id = current_user.id
    @rating.movie_id = params[:movie_id]
    @rating.save
  end

  def update
    @rating = Rating.find(params[:id])
    unless @rating.update(rating_params)
      puts "N"
    end
  end
  private
  def rating_params
    params.require(:rating).permit(:rating, :thoughts)
  end
end
