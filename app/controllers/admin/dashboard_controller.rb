class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @blogs = Blog.all
    @users = User.all
    @categories = Category.all
  end

  private

  def require_admin
    unless current_user.admin?
      flash[:alert] = "You are not authorized to access this section."
      redirect_to root_path
    end
  end
end
