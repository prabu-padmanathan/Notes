class Note < ActiveRecord::Base
	belongs_to :directory
	attr_accessible :name,:directory_id,:content
	validates :name, presence: { message: "File name must not be empty" }
	validates :name, format: { with: /\A[a-zA-Z]+\z/,message: "File name must be letters" }
	validates :content, presence: { message: "File content must not be empty" }
	validates :directory_id, presence: { message: " Folder must not be empty" }

	def self.get_files_for_directory(dir_id)
		Note.where(directory_id: dir_id)
	end
end