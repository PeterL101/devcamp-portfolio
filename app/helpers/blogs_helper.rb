module BlogsHelper

  def blog_status_color blog
    "color: red;" if blog.draft?
  end
end
