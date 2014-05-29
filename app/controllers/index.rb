get '/' do
  erb :index
end

post '/signup' do
  # CREATE NEW USER
  redirect '/users/profile'
end

post '/login' do
  # AUTHENTICATE USER
  redirect '/users/profile'
end

get '/logout' do
  session.clear
  redirect '/'
end

