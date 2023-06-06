class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
  end

  def index
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      puts "=======>", @category.errors.messages.inspect
      render :new, status: :unprocessable_entity
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
