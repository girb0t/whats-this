get '/mygames' do
# List of all games played by user.
  if session[:user_id]
    @user = User.find(session[:user_id])
    @user_created_game_first_elements = get_first_elements(@user.get_created_games)
    @user_contributions = @user.get_participated_games_contributions
    erb :my_games
  else
    session[:last_error] = "Must be logged in to view 'mygames'"
    redirect '/'
  end
end

get '/new' do
  if session[:user_id]
    erb :new_game
  else
    session[:last_error] = "Must be logged in to create new game."
    redirect '/'
  end
end

get '/games/inprogress' do
######## SWITCH ON PAGE WHERE OPTIONS: ALL, PICTURES, DESCRIPTIONS
# Shows list of all games in games_in_progress
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
  @timeline = @game.get_timeline
	if @game.is_complete
	  erb :completed_game
	else
    session[:last_error] = "Can't view timeline of incomplete game!"
    redirect '/'
	end
end

get '/games/:id/play' do
  if session[:user_id]
    game = Game.find(params[:id])
    if game.get_last_game_element.user_id == session[:user_id]
      session[:last_error] = "Dude, you can't play your own contribution. Lame."
      redirect '/'
    else
      session[:game_id] = params[:id]
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
  else
    session[:last_error] = "Please sign in or create an account to play."
    redirect '/'
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
  if session[:game_id]
    game = Game.find(session[:game_id])
  	drawing = Drawing.new(picture: params["svg"], game_id: game.id, user_id: session[:user_id], description_id: session[:last_description_id])
  	drawing.save
    game.check_finished

    session.delete(:game_id)
    session.delete(:last_description_id)
    redirect '/'
  else #this is a new game
    game = Game.new(user_id: session[:user_id])
    game.save
    drawing = Drawing.new(picture: params["svg"], game_id: game.id, user_id: session[:user_id], description_id: nil)
    drawing.save
    redirect '/'
  end
end

post '/describe' do
# Adds description to database
  if session[:game_id]
    game = Game.find(session[:game_id])
  	description = Description.new(body: params[:description], game_id: game.id, user_id: session[:user_id], drawing_id: session[:last_picture_id])
  	description.save
    game.check_finished

    session.delete(:game_id)
    session.delete(:last_picture_id)
    redirect '/'
  else
    game = Game.new(user_id: session[:user_id])
    game.save
    description = Description.new(body: params[:description], game_id: game.id, user_id: session[:user_id], drawing_id: nil)
    description.save
    redirect '/'
  end
end

