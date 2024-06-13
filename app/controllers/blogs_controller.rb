class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
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
    params.require(:blog).permit(:headline, :description, :image)
  end
end
