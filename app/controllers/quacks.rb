# get quack
get '/quacks/:id/show' do
  @quacks = Quack.all
  erb :quacks
end

# create
post '/quacks/create' do
  quack = Quack.create( params )
  redirect "/users/#{quack.user_id}"
end

# delete quack
post '/quacks/:id/delete' do
  p params["id"].to_i
	quack = Quack.find_by_id(params["id"].to_i).destroy
  redirect "/user/#{quack.user_id}"
end


