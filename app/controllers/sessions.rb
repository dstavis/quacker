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

post '/logout'  do
  session[:user_id] = nil
  redirect '/?message=You are now logged out.'
end
