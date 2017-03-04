class CpanelController < ApplicationController
  include ControllersHelper
  before_action :authenticate_user!
  before_action :verify_admin

  def show
    @people = Person.all
    @newpic = SlideshowPic.new
    @allpics = SlideshowPic.all
  end
  def users
    @users = User.last(100)
  end

  def articles
    @articles = []

    articles_assoc = Article.all

    articles_assoc.each do |art|
      obj = OpenStruct.new
      obj.id = art.id
      obj.url = article_path(art.id)
      obj.title = art.title
      obj.author = User.find_by_id(art.author)
      obj.author = @removed_user unless obj.author
      obj.thumbnail_url = art.thumbnail.url(:front_page)
      obj.approved = art.approved
      @articles.push(obj)
    end
  end

  def trivia
    @trivia = Trivium.all
  end

  def getUser
  end
end
