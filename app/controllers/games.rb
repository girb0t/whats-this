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
	@game = Game.find(params[:id])

	if @game.is_complete
# shows a completed game
	  erb :completed_game
	else
		redirect '/'# TO APPROPRIATE GET REQUEST, DEPENDING ON
	end					  # MOST RECENT GAME INPUT (DRAWING OR DESCRIPTION)
end

get '/games/:id/draw' do
	@game = Game.find(params[:id])
	@description = Description.where(game_id: params[:id]).last
# add drawing to selected game
  erb :draw
end

post '/games/:id/draw' do
	drawing = Drawing.new(picture: params[:sketch], game_id: params[:id], user_id: session[:user_id], description_id: params[:description_id])
	drawing.save
# Adds drawing to database
  redirect '/'
end

get '/games/:id/describe' do
	@game = Game.find(params[:id])
	@drawing = Drawing.where(game_id: params[:id]).last
# Add a description to a game. Will this be done on the main page?
  erb :describe
end

post '/games/:id/describe' do
	description = Description.new(body: params[:description], game_id: params[:id], user_id: session[:user_id], drawing_id: params[:drawing_id])
	description.save
# Adds description to database
  redirect '/'
end

