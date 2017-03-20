class UsersController < ApplicationController
  before_action :find_user, only: [:show]
  require 'ostruct'

  def prepRatings(ratingsAssoc)
    arr = []
    ratingsAssoc.each do |rating|
      obj = OpenStruct.new
      mov = Movie.find(rating.movie_id)
      obj[:mov_title] = mov.title
      obj[:rating] = rating.rating
      obj[:thoughts] = rating.thoughts
      obj[:rating_date] = rating.updated_at
      obj[:mov_year] = mov.release_date.year
      obj[:mov_cover_url] = mov.cover_img.url(:front_page)
      obj[:mov_url] = movie_path(rating.movie_id)

      arr.push(obj)
    end
    arr
  end

  def show
    ratings = Rating.where(user_id: params[:id]).last(10).reverse
    @recently_rated = prepRatings(ratings)

    ratings = Rating.where(user_id: params[:id]).order("rating DESC").first(10)
    @highest_rated = prepRatings(ratings)

    @articles = []

    articles_assoc = Article.where(author: params[:id])
    articles_assoc.each do |art|
      obj = OpenStruct.new
      obj.title = art.title
      obj.url = article_path(art.id)
      obj.thumbnail_url = art.thumbnail.url(:front_page)
      @articles.push(obj)
    end

    @comments = Comment.where(user_id: params[:id])
  end

  private
  def find_user
    @user = User.find(current_user.id)
  end
end
