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

  def getUser
  end
end
