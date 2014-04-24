#All user-creation related routes
get '/' do
	erb :login_or_signup
end

get '/profile' do
	erb :profile_page
end