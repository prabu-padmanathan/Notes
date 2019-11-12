class NotesUser < ActiveRecord::Base
	attr_accessible :name,:password
	has_many :directories, :dependent => :delete_all
	validates :name, presence: true
	validates :name, uniqueness: { case_sensitive: false, message: "Sorry !! The username already taken"}
	validates :name,length: { minimum: 3, maximum: 25 }
	validates :name, format: { with: /^[a-zA-Z0-9@.]*$/,message: "Folder name must be alphanumeric , # and @ are allowed" }

	def self.get_user_by_name(user_name)
		NotesUser.where(:name=> user_name).first
	end

end