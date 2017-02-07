module ArticlesHelper
  def get_user(comment)
     if comment.user_id
       @user = User.find(comment.user_id).email
     end
  end
end
