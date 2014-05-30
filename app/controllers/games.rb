get '/games/inprogress' do
	@games_in_progress = Game.where(is_complete: false)
# Shows list of all games in progress
  erb :incomplete_games
end

get '/games/completed' do
	@finished_games = Game.where(is_complete: true)
# Shows list of completed games
  erb :finished_games
end

get '/games/:id' do
	@game = Game.find(params[:id])

	if @game.is_complete
# shows a completed game
	  erb :completed_game
	else
		redirect # TO APPROPRIATE GET REQUEST, DEPENDING ON
						 # MOST RECENT GAME INPUT (DRAWING OR DESCRIPTION)
end

get '/games/:id/draw' do
	@game = Game.find(params[:id])
	@description = Description.find_by_game(params[:id]).last
# add drawing to selected game
  erb :draw
end

post '/games/:id/draw' do
	drawing = Drawing.new(svg_file: PICTURE INFO GOES HERE!!!!!!, game_id: params[:id], user_id: session[:user_id], description_id: DESCRIPTION)
	drawing.save
# Adds drawing to database
  redirect '/games/inprogress'
end

get '/games/:id/describe' do
	@game = Game.find(params[:id])
	@drawing = Drawing.find_by_game(params[:id]).last
# Add a description to a game. Will this be done on the main page?
  erb :describe
end

post '/games/:id/describe' do
	description = Description.new(svg_file: PICTURE INFO GOES HERE!!!!!!, game_id: params[:id], user_id: session[:user_id], drawing_id: DRAWING)
	description.save
# Adds description to database
  redirect '/games/inprogress'
end

