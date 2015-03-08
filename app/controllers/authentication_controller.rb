class AuthenticationController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cheeses_path
      flash[:notice] = "Successfully signed in"
    else
      flash[:notice] = 'User could not be authenticated. Please try again.'
      render :new
    end
  end




end
