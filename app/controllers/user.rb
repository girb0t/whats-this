#only visible to user
get '/users/profile' do
# Default user page. Has links to see in progress games, games created by user, games played by user.
end

get '/users/createdgames' do
# List of completed (and maybe in progress) games created by user
end

get '/users/playedgames' do
# List of all games played by user.
end
