module ArticlesHelper
  def get_user(comment)
     if comment.user_id
       unless @user = User.find_by_id(comment.user_id)
         @user = @removed_user.email
       end
     end
  end
end
