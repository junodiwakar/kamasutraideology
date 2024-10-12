class Admin::BlogsController < ApplicationController
  before_action :set_blog, only: [:edit,:update,:destroy]
  before_action :set_categories, only: [:new,:create, :edit, :update]

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
      redirect_to new_admin_blog_path
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blog_path(@blog), notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to admin_dashboard_path, notice: 'Blog was successfully destroyed.'
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
