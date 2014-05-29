get '/games/inprogress' do
# Shows list of all games in progress
end

get '/games/completed' do
# Shows list of completed games
end

get '/games/:id' do
# shows individual game (only done?)
end

get '/games/:id/draw' do
# add drawing to selected game
end

post '/games/:id/draw' do
# Adds drawing to database
end

get '/games/:id/describe' do
# Add a description to a game. Will this be done on the main page?
end

post '/games/:id/describe' do
# Adds description to database
end

