class HomeController < ApplicationController
  def index
    @blogs = Blog.all
    @health_blogs = Blog.joins(:categories).where(categories: { name: 'Health' })
    @technology_blogs = Blog.joins(:categories).where(categories: { name: 'Technology' })
  end
end
