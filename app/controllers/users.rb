post '/users' do
	new_user = User.new(username: params[:username], bio: params[:bio])
	new_user.password = params[:password]
	new_user.save
	redirect '/?message=Thank you for signing up. Please log in to your new account.'
end

get '/users' do
   @users = User.all
   erb :list_users
end

get '/users/:id/followees' do
    user_id = session[:user_id]
    # followee_id
    # @followees = Flocking.where(user_id => followee_id)
    current_user = User.find(user_id)
    @flockings = current_user.flockings.all
    @followees=[]
    @flockings.each do |flocked|

        @followees<<User.find_by_id(flocked.followee_id)

          #<li><%=User.find_by_id(followee.followee_id).username %></li>

    end

    p "**********"
    p @followees
    p "**********"
    erb :list_followees
end

get '/users/:id' do
	@user = User.find(params[:id])
	#pull in quackmaker form??

	# p User.first.followed_by
	# p User.first.follows
	erb :profile_page
end

post '/flockings/new' do
  current_user = User.find(session[:user_id])
  current_user.flockings.build( followee_id: params[:followee_id] )
  current_user.save
  p "**********"
  p Flocking.all
  # Flocking.create(followee_id: params[:followee_id], follower_id: current_user.id)
  redirect "/users/#{current_user.id}/followees"
end

# ps ax | grep whatever



# a get route that shows all users                       '/users'
# a button to follow

# a post route that follows
# create a form with a button that will post to follow/followee_id
# work on logic in post route                            '/flockings/new'
# redirect to a route that shows all followees


# a route that shows followees for thes session[:user] that includes new user
# list all the session users followees





# a route that shows followers

