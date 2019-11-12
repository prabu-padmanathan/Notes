class Directory < ActiveRecord::Base
	has_many :notes, :dependent => :delete_all
	has_many :directories, :dependent => :delete_all
	attr_accessible :name,:parent_id,:user_id
	validates :name, presence: true
	validates :name, uniqueness: {message: "directory name must be unique"}
	validates :name, format: { with: /\A[a-zA-Z]+\z/,message: "Folder name must be letters" }
	validates :parent_id, presence: true


	def self.get_root
		Directory.where(name: "root").first
	end

	def self.get_all_except_root(user_id)
		Directory.where(parent_id: 1,:user_id=>user_id)
	end

end