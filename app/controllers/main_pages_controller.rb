class MainPagesController < ApplicationController
  def front_page
    @articles = Article.where(approved: true).last(4).reverse
    @movies = Movie.all
    @trivia = Trivium.where(context: 0).order("RANDOM()").first(2)
  end

  def discover_page
  end

  def learn_page
  end

  def discuss_page
  end

  def articles
  end
end
