class MainPagesController < ApplicationController
  def front_page
    @articles = Article.all
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
