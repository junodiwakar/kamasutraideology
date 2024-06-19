class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_blog, only: [:show]

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
    @categories = Category.all
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to @blog
    else
      render 'new'
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:headline, :description, :slug, :image, category_ids: [])
  end

  def set_blog
    @blog = Blog.find_by!(slug: params[:id])
  end
end
