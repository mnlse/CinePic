class UsersController < ApplicationController
  before_action :find_user, only: [:show]

  def show
  end

  private
  def find_user
    @user = User.find(current_user.id)
  end
end
