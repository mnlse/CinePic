class JsonController < ApplicationController
  def get_slideshow_imgs
    msg = []
    @allpics = SlideshowPic.all
    def get_dest_url(resource, id)
      eval("#{resource}_path(#{id})")
    end

    @allpics.each do |pic|
      destination_resource = SlideshowPic.destination_types.key(pic.destination_type)
      destination_id = pic.destination_id
      destination_url = pic.destination_url

      msg.push({ 
        link_url: (destination_url.blank?) ? get_dest_url(destination_resource, destination_id) : destination_url,
        pic_url: pic.picture.url(:default) })
    end

    respond_to do |format|
      format.html { render html: msg }
      format.json { render json: msg }
    end
  end
end
