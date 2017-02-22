module ControllersHelper
  def verify_admin
    (current_user.nil?) ? redirect_to(root_path) : redirect_to(root_path) unless current_user.privilege == "admin"
  end
end
