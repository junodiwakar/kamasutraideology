class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_blog, only: [:show]
  before_action :set_categories, only: [:new,:create]
  before_action :require_admin, only: [:new,:create]

  def index
    if params[:category]
      @blogs = Blog.joins(:categories).where(categories: { name: params[:category] })
    else
      @blogs = Blog.all
    end
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to @blog, notice: "blog created successfully!"
    else
      flash[:alert] = "Failed to create a blog."
      redirect_to new_blog_path
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:headline, :description, :slug, :image, category_ids: [])
  end

  def set_blog
    @blog = Blog.find_by!(slug: params[:id])
  end

  def set_categories
    @categories =  Category.all
  end

  def require_admin
    unless current_user.admin?
      flash[:alert] = "You are not authorized to access this section."
      redirect_to root_path
    end
  end
end
