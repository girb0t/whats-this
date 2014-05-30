get '/games/inprogress' do
######## SWITCH ON PAGE WHERE OPTIONS: ALL, PICTURES, DESCRIPTIONS
	@games_in_progress = Game.where(is_complete: false)

# Shows list of all games in progress
  erb :incomplete_games
end

get '/games/archive' do
	@archived_games = Game.where(is_complete: true)
# Shows list of completed games
  erb :finished_games
end

get '/games/:id' do
########### VIEW COMPLETED CHAIN
	@game = Game.find(params[:id])
	if @game.is_complete
	  erb :completed_game
	else
		redirect '/'
end

get '/games/:id/play' do
############ NEXT MOVE IN A GAME. POSSIBLE BETTER WORD CHOICE.
############ NEED METHOD IN GAME MODEL TO FETCH LAST GAME PART.
	@game = Game.find(params[:id])
	@description = Description.where(game_id: params[:id]).last
	@drawing = Drawing.where(game_id: params[:id]).last
# add drawing to selected game
  erb :play
end

post '/games/:id/draw' do
# Adds drawing to database
	drawing = Drawing.new(picture: params[:sketch], game_id: params[:id], user_id: session[:user_id], description_id: params[:description_id])
	drawing.save
  redirect '/'
end

# get '/games/:id/describe' do
# 	@game = Game.find(params[:id])
# 	@drawing = Drawing.where(game_id: params[:id]).last
# # Add a description to a game. Will this be done on the main page?
#   erb :describe
# end

post '/games/:id/describe' do
# Adds description to database
	description = Description.new(body: params[:description], game_id: params[:id], user_id: session[:user_id], drawing_id: params[:drawing_id])
	description.save
  redirect '/'
end

