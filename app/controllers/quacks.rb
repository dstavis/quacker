get '/quacks/:id' do #not restful
  @quacks = Quack.all
  erb :quacks
end

# create
post '/quacks' do
  quack = Quack.create( params )
  redirect "/users/#{quack.user_id}"
end

# delete quack
post '/quacks/:id/delete' do
  p params["id"].to_i
	quack = Quack.find_by_id(params["id"].to_i).destroy #consider switching to just "find"(defaults to by id)
  redirect "/users/#{quack.user_id}"
end


