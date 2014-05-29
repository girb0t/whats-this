get '/games/inprogress' do
# Shows list of all games in progress
  erb :incomplete_games
end

get '/games/completed' do
# Shows list of completed games
  erb :finished_games
end

get '/games/:id' do
# shows a completed game
  erb :completed_game
end

get '/games/:id/draw' do
# add drawing to selected game
  erb :draw
end

post '/games/:id/draw' do
# Adds drawing to database
  redirect '/games/inprogress'
end

get '/games/:id/describe' do
# Add a description to a game. Will this be done on the main page?
  erb :describe
end

post '/games/:id/describe' do
# Adds description to database
  redirect '/games/inprogress'
end

