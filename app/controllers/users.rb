get '/' do
	@message = params[:message]

	erb :login_or_signup
end


post '/login' do
	@user = User.where(username: params[:username]).first

	if @user && @user.password == params[:password]
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		redirect "/?message=Failed Login"
	end
end


post '/users' do
	new_user = User.new(username: params[:username], bio: params[:bio])
	new_user.password = params[:password]
	new_user.save
	redirect '/?message=Thank you for signing up. Please log in to your new account.'
end


get '/users/:id' do
	@user = User.find(params[:id])
	#pull in quackmaker form??

	p User.first.followed_by
	p User.first.follows
	erb :profile_page
end

post '/follow/:followee_id' do
  current_user = User.find(session[:user_id])
  current_user.flockings.build(followee_id: params[:followee_id])
  # Flocking.create(followee_id: params[:followee_id], follower_id: current_user.id)
  redirect "/"
end


get 'logout'  do
	session[:user_id] = nil
	redirect '/?message=You are now logged out.'
end
