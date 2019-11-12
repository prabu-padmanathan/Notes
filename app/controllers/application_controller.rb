class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :logged_in?
  before_filter :require_user
 

  def logged_in?
  	current_user.present?
  end

  def current_user
  	@current_user ||= NotesUser.find(session[:user_id]) if session[:user_id]
  end

  private
  def require_user
		if !logged_in?
			flash[:danger] = "You must be logged in to perform that action"
			redirect_to login_path
		end
	end
end
