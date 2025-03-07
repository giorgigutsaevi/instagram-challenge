class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) 
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Instagram!"
      redirect_to posts_url
    else
      render "new"
    end
  end

  private 
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end
