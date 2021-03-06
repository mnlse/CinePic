class ArticlesController < ApplicationController
  include ControllersHelper
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_article, except: [:index]
  before_action :verify_admin, only: [:approve, :disapprove]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.last(4)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    unless @author = User.find_by_id(@article.author)
      @author = @removed_user
    end
    @comments = Comment.where(article_id: @article.id)
    @new_comment = Comment.new
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.author = current_user.id

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    @article.approved = true
    if @article.save
      flash[:notice] = "Article #{@article.id} has been approved."
      redirect_to cpanel_articles_path
    end
  end

  def disapprove
    @article.approved = false
    if @article.save
      flash[:notice] = "Article #{@article.id} has been disapproved."
      redirect_to cpanel_articles_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :content, :author, :approved, :thumbnail)
    end
end
