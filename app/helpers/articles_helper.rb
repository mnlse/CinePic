module ArticlesHelper
  def get_user(comment)
     if comment.user_id
       @user = User.find(comment.user_id)
     else
       @user = User.first
     end
  end
end
