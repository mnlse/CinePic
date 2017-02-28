class MainPagesController < ApplicationController
  def front_page
    @articles = Article.last(4).reverse
    @movies = Movie.all
    @trivium = Trivium.first
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
