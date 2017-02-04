class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
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
    @movie = Movie.find(params[:id])
  end

  def destroy
    @movie = Movie.destroy(params[:id])
    redirect_to 'index'
  end

  private
  def movie_params
    params.require(:movie).permit(:title, :description, :actors, :genres, :writers, :runtime, :director)
  end
end
