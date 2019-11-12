class DirectoriesController < ApplicationController
	
	def index
			logger.debug "current user: #{current_user.inspect}"
			@except_root_directories=Directory.get_all_except_root(@current_user.id)
	end

	def new
		@dir=Directory.new
	end

	def destroy
		dir=Directory.find(params[:id])
		dir.delete
		flash[:notice] = 'folder dropped successfully'
		redirect_to directories_path
	end


	def create
		rootdir=Directory.find(1)
		dirparam=params[:directory]
		logger.debug "current user: #{current_user.inspect}"
		@dir=Directory.new(:name=>params[:directory][:name],:parent_id=>rootdir.id,:user_id => @current_user.id)
		
		if @dir.save
			flash[:notice] = 'Directory created successfully'
			redirect_to directories_path
		else
			render 'new'
		end
	end

end