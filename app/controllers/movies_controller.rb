class MoviesController < ApplicationController
  before_action :find_movie, only: [:destroy, :show, :edit, :update]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    @people_movies = PeopleMovies.new
  end

  def create
    @movie = Movie.new(movie_params)
    
    if @movie.save
      redirect_to movie_path(@movie)
    else
      render 'new'
    end
  end

  def show
    if !current_user.nil?
      @rating = Rating.where(user_id: current_user.id, movie_id: @movie.id).first
      if @rating.nil?
        @rating = Rating.new
        @rating.thoughts = "new"
      end
    else
      @rating = Rating.new
      @rating.thoughts = "not logged in"
    end
  end

  def edit
  end
  
  def update
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    redirect_to 'index'
  end

  def new_person
  end

  def edit_person
  end

  def destroy_person
  end

  private
  def find_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:ratingcounter, :avgrating, :release_date, 
                                  :title, :description, :cover_img, :actors, 
                                  :genres, :writers, :runtime, :director, 
                                  :yt_trailer_url)
  end
end
