class SessionsController <ApplicationController
	include AuthHelper
	skip_before_filter :require_user, only: [:new, :create]
	
	def new

	end

	def create
		user = NotesUser.get_user_by_name(params[:session][:name].downcase)
		if user && authenticate_user(user.name,params[:session][:password])
			session[:user_id] = user.id
			flash[:notice] = "You have successfully logged in"
			redirect_to directories_path(user)
		else
			flash.now[:danger] = "There was something wrong with your login information"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to login_path
	end
end