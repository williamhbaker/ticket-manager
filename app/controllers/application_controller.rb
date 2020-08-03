class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :require_same_user
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = 'Access denied.'
      redirect_to root_path
    end
  end

  def require_same_user(user)
    if user != current_user
      flash[:error] = 'Access denied.'
      redirect_to root_path
    end
  end
end
