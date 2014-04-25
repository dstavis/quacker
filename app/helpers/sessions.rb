helpers do
	def logged_in?
		!!session[:user_id]
	end

	def current_user
		return "This isn't implemented yet!"
	end
end