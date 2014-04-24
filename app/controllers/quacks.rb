post '/quacks/:id/delete/' do
	Post.find_by(params[:id]).destroy
end
#status 
