class CommentsController < ApplicationController
  def new
  end

  def create
    @new_comment = Comment.new(params.require(:comment).permit(:content))
    @new_comment.user_id = current_user.id
    @new_comment.article_id = params[:article_id]
    if @new_comment.save
      redirect_to article_path(params[:article_id])
    end
  end

  def show
  end
end
