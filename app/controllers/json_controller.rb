class JsonController < ApplicationController
  def get_slideshow_imgs
    msg = []
    @allpics = SlideshowPic.all

    @allpics.each do |pic|
      msg.push({ 
        destination_type: SlideshowPic.destination_types.key(pic.destination_type),
        destination_id: pic.destination_id,
        destination_url: pic.destination_url,
        pic_url: pic.picture.url(:default) })
    end

    respond_to do |format|
      format.html { render html: msg }
      format.json { render json: msg }
    end
  end
end
