class NotesUsersController < ApplicationController
	include AuthHelper
	def new
		@notes_user=NotesUser.new
	end

	def create
		pwd1=params[:notes_user][:password].to_s
		pwd2=params[:notes_user][:confirm_password].to_s
		username=params[:notes_user][:name].to_s
		logger.debug "New article: #{params[:notes_user].inspect}"
		@notes_user=NotesUser.new(:name=>username,:password=>create_hash_digest(params[:notes_user][:password]))
		if pwd1.empty? || pwd2.empty?
			flash.now[:danger] = "Please enter passwords"
			render 'new'
		elsif pwd1 != pwd2
			flash.now[:danger] = "passwords are not matching"
			render 'new'
		else
			if @notes_user.save
				flash.now[:notice] = "User created !! please login with the credentils"
				redirect_to login_path
			else
				flash.now[:danger] = "There is some problem on creating the user"
				render 'new'
			end

		end
	end

end