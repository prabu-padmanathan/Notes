class NotesController < ApplicationController
	
	def index
		@dir_id=params[:directory_id]
		@notes= Note.get_files_for_directory(params[:directory_id])
	end

	def new
		@note=Note.new
		@dir_id=params[:dir_id]
	end

	def create
		noteparam=params[:notes]
		@note=Note.new(:name=>params[:note][:name],:content=>params[:note][:content],:directory_id=>params[:directory_id])
		@dir_id=params[:directory_id]
		if @note.save
			flash[:notice] = 'Note created successfully'
			redirect_to notes_path(:directory_id=>@dir_id)
		else
			render 'new'
		end
	end

	def edit
		@note=Note.find(params[:id])
		@dir_id=params[:dir_id]
	end

end