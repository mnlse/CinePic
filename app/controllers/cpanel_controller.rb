class CpanelController < ApplicationController
  include ControllersHelper
  before_action :authenticate_user!
  before_action :verify_admin

  def show
    @users = User.all
  end
end
