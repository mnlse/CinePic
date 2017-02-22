class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def show
    @ratings = Rating.where(user_id: @user.id)
    @comments = Comment.where(user_id: @user.id)
  end

  private
  def find_user
    @user = User.find(current_user.id)
  end
end
