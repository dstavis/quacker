get '/' do
	@message = params[:message]
	erb :login_or_signup
end


post '/login' do
	# authenticate user, stuff user_id into session
	@user = User.where(username: params[:username]).first
	
	# if this_user.password == params[:password]
	# 	redirect "/users/#{this_user.id}"
	# session[:user_id] = this_user.id
	# else
	# 	@message = "Failed Login"
	# 	redirect '/'
	# end
	if @user && @user.password == params[:password]
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		redirect "/?message=Failed Login"
	end
end


post '/users' do
	#save user info, encrypt password & store
	new_user = User.new(username: params[:username], bio: params[:bio])
	new_user.password = params[:password]
	new_user.save
	redirect '/?message=Thank you for signing up. Please log in to your new account.'
end


get '/users/:id' do
	@user = User.where(id: params[:id]).first
	#pull in quackmaker form??
	erb :profile_page
end


get 'logout'  do
	session[:user_id] = nil
	redirect '/?message=You are now logged out.'
end
