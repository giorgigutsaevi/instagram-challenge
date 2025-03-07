class SessionsController < ApplicationController

  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      # redirect_to posts_url
      redirect_to posts_url
    else
      flash[:danger] = 'Invalid email or password'
      render "new"
    end
  end

  def destroy
    log_out 
    redirect_to root_url
  end
end
