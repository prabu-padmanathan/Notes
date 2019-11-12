module AuthHelper
	def create_hash_digest(password)
  		BCrypt::Password.create(password)
	end
 
	def verify_hash_digest(password)
  		BCrypt::Password.new(password)
	end

	def authenticate_user(username, password)
		user_record=NotesUser.get_user_by_name(username)
		if user_record==nil
			return ""
		elsif verify_hash_digest(user_record.password) == password
        	return user_record
    	end
	end
end
