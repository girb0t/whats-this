#only visible to user
# get '/users/profile' do
# 	@user = User.find(session[:user_id])
# 	@user_created_games = @user.games

# 	##### I know the statements are probably wrong, but one of these two options should work

# # 1
# 	@user_played_games = Drawing.where(user_id: session[:user_id])
# 	@user_played_games << Description.where(user_id: session[:user_id])
# 	@user_played_games.flatten!

	##### Complicated database query. I hope it's correct.

# 2
	# users_played_games = Drawing.all.find_by_user_id(session[:user_id])
	# users_played_games << Description.all.find_by_user_id(session[:user_id])
	# @user_played_game_ids = []

	# users_played_games.each do |game_part|
	# 	@user_played_game_ids << game_part.game_id
	# end
# Default user page. Has links to see in progress games, games created by user, games played by user.
#   erb :profile_page
# end

# get '/users/createdgames' do
# # List of completed (and maybe in progress) games created by user
# end

# get '/mygames' do
# 	@user = User.find(session[:user_id])
# 	@games = @user.games

# 	@user_game_parts = Drawing.where(user_id: @user.id)
# 	@user_game_parts << Description.where(user_id: @user.id)
# 	@user_game_parts.flatten!

# 	@user_played_game_ids = []
# 	@user_game_parts.each do |game_part|
# 		@user_played_game_ids << game_part.game_id
# 	end
# 	@user_played_game_id.uniq!
# 	@user_played_games = Game.where(id: @user_played_game_id)
# 	erb :my_games
#   # erb :played_games
#   # erb :created_games
# # List of all games played by user.
# end
