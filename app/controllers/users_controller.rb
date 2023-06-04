class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update] #:destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash.notice = "Changes were saved!"
      redirect_to edit_user_path(@user)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.order(created_at: :desc).page params[:page]
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :image)
    end

    def set_user
      @user = User.find(current_user.id)
    end
end
