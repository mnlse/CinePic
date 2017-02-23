class SlideshowPicsController < ApplicationController
  before_action :find_slideshow, only: [:edit, :destroy]

  def create
    @slideshow_pic = SlideshowPic.new(slideshowpic_params)
    if @slideshow_pic.save
      redirect_to slideshow_pics_panel_path
    elsif
      redirect_to root_path
    end
  end

  def destroy
    if @slideshow_pic.destroy
      redirect_to cpanel_path
    else
      redirect_to root_path
    end
  end

  private
  def find_slideshow
    @slideshow_pic = SlideshowPic.find(params[:id])
  end

  def slideshowpic_params
    params.require(:slideshow_pic).permit(:picture, :destination_type, :destination_id, :destination_url)
  end

end
