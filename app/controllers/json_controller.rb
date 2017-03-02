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

  def get_articles
    last_article_id = params[:last_id].to_i
    articles = []
    served_counter = 0
    articles_per_req = 4
    @temp = Article.where(["id < ? AND id > ?", last_article_id, last_article_id - articles_per_req]).reverse.to_a

    @temp.each do |record|
      unless record.title.nil? or record.title.blank? or served_counter == articles_per_req
        obj = {}
        obj[:id] = record.id
        obj[:url] = article_path(record.id)
        obj[:thumb_url] = record.thumbnail.url(:front_page)
        obj[:title] = record.title
        obj[:content] = ActionController::Base.helpers.truncate(ActionController::Base.helpers.sanitize(record.content, tags: []), length: 600)

        articles.append(obj)
        served_counter += 1
      end
    end
    @temp.append(last_article_id)

    respond_to do |format|
      format.html { render html: articles }
      format.json { render json: articles }
    end
  end

  def autocomplete_search
    query = params[:query]
    msg = []
    unless query.nil? or query.blank?
      results = Movie.where("lower(title) LIKE ?", "%#{query.downcase}%").to_a

      results.each do |r|
        obj = {}
        obj[:title] = r.title
        obj[:year] = r.release_date.year
        obj[:thumbnail_url] = r.cover_img.url(:show_page)
        obj[:url] = movie_path(r.id)
        msg.push(obj)
      end

      respond_to do |format|
        format.html { render html: msg }
        format.json { render json: msg }
      end
    else
      raise 'Bad query'
    end
  end

end
