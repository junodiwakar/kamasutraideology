class BlogsController < ApplicationController
  before_action :set_blog, only: [:show]

  def index
    if params[:category]
      @blogs = Blog.joins(:categories).where(categories: { name: params[:category] })
    else
      @blogs = Blog.all
    end
  end

  def show
  end

  private

  def blog_params
    params.require(:blog).permit(:headline, :description, :slug, :image, category_ids: [])
  end

  def set_blog
    @blog = Blog.find_by!(slug: params[:id])
  end

end
