module BlogsHelper
  def choose_new_or_edit
    if ["new", "create"].include?(action_name)
      confirm_blogs_path
    elsif action_name == "edit"
      blog_path
    end
  end

end
