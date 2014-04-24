post '/quacks' do
  Quack.create( params )
  redirect '/show'
end

get '/show' do
  @quacks = Quacks.all
  erb :quacks
end