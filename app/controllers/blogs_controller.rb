class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_blog, only: [:show]
  before_action :set_categories, only: [:new,:create]

  def index
    @blogs = Blog.all
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
end
