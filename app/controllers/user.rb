#only visible to user
get '/users/profile' do
	@user = User.find(session[:user_id])
	@users_created_games = @user.games

	##### I know the statements are probably wrong, but one of these two options should work

# 1
	@users_played_games = Drawing.where(user_id: session[:user_id])
	@users_played_games << Description.where(user_id: session[:user_id])
	@users_played_games.flatten!

	##### Complicated database query. I hope it's correct.

# 2
	# users_played_games = Drawing.all.find_by_user_id(session[:user_id])
	# users_played_games << Description.all.find_by_user_id(session[:user_id])
	# @user_played_game_ids = []

	# users_played_games.each do |game_part|
	# 	@user_played_game_ids << game_part.game_id
	# end
# Default user page. Has links to see in progress games, games created by user, games played by user.
  erb :profile_page
end

get '/users/createdgames' do
	@user = User.find(session[:user_id])
	@games = @user.games
# List of completed (and maybe in progress) games created by user
  erb :created_games
end

get '/users/playedgames' do
	users_played_games = Drawing.where(user_id: session[:user_id])
	users_played_games << Description.where(user_id: session[:user_id])
	@users_played_games.flatten!
	@user_played_game_ids = []

	users_played_games.each do |game_part|
		@user_played_game_ids << game_part.game_id
	end
# List of all games played by user.
  erb :played_games
end
