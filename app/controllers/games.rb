get '/mygames' do
	@user = User.find(session[:user_id])
	@games = @user.games

	@user_game_parts = Drawing.where(user_id: @user.id)
	@user_game_parts << Description.where(user_id: @user.id)
	@user_game_parts.flatten!

	@user_played_game_ids = []
	@user_game_parts.each do |game_part|
		@user_played_game_ids << game_part.game_id
	end
	@user_played_game_id.uniq!
	@user_played_games = Game.where(id: @user_played_game_id)
	erb :my_games
  # erb :played_games
  # erb :created_games
# List of all games played by user.
end

get '/games/inprogress' do
######## SWITCH ON PAGE WHERE OPTIONS: ALL, PICTURES, DESCRIPTIONS
# Shows list of all games in progress
	@games_in_progress = Game.where(is_complete: false)
  erb :games_in_progress
end

get '/games/archive' do
# Shows list of completed games
	@archived_games = Game.where(is_complete: true)
  erb :archived_games
end

get '/games/:id' do
########### VIEW COMPLETED CHAIN
	@game = Game.find(params[:id])
	if @game.is_complete
	  erb :completed_game
	else
		redirect '/'
	end
end

get '/games/:id/play' do
############ NEXT MOVE IN A GAME. POSSIBLE BETTER WORD CHOICE.
  session[:game_id] = params[:id]
  game = Game.find(session[:game_id])
  last_game_element = game.get_last_game_element
  if last_game_element.class == Drawing
    puts '*' * 60
    redirect '/describe'
  else
    puts '#' * 60
    p 
    redirect '/draw'
  end
end

get '/describe' do
  @game = Game.find(session[:game_id])
  @last_picture = @game.get_last_game_element
  session[:last_picture_id] = @last_picture.id
  erb :describe
end

get '/draw' do
  @game = Game.find(session[:game_id])
  @last_description = @game.get_last_game_element
  session[:last_description_id] = @last_description.id
  erb :draw
end

post '/draw' do
# Adds drawing to database
	drawing = Drawing.new(picture: params["svg"], game_id: session[:game_id], user_id: session[:user_id], description_id: session[:last_description_id])
	drawing.save
  redirect '/'
end

post '/describe' do
# Adds description to database
	description = Description.new(body: params[:description], game_id: session[:game_id], user_id: session[:user_id], drawing_id: session[:last_picture_id])
	description.save
  redirect '/'
end

