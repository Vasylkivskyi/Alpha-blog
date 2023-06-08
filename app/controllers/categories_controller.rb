class CategoriesController < ApplicationController
  include ApplicationHelper

  before_action :require_admin, except: %i[index show]
  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.order(created_at: :desc).page params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end
end
