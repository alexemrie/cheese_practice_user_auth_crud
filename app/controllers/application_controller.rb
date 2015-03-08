class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def ensure_current_user
    unless current_user
      redirect_to root_path
      flash[:notice] = 'You must register or log in before you can do that!'
    end
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  helper_method :current_user
end
