class SlideshowPicsController < ApplicationController
  def panel
    @newpic = SlideshowPic.new
    @allpics = SlideshowPic.all
  end
  def create
    @slideshow_pic = SlideshowPic.new(slideshowpic_params)
    if @slideshow_pic.save
      redirect_to slideshow_pics_panel_path
    elsif
      redirect_to root_path
    end
  end

  private
  def slideshowpic_params
    params.require(:slideshow_pic).permit(:picture, :destination_type, :destination_id, :destination_url)
  end
end
