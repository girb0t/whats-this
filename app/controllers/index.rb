get '/' do
  erb :index
end

post '/signup' do
  # CREATE NEW USER
  redirect '/users/profile'
end

post '/login' do
  # AUTHENTICATE USER
  user = User.find_by_username(params[:username])
  if user && user.authenticate(params[:password])
    redirect '/users/profile'
  else

  end
end

get '/logout' do
  session.clear
  redirect '/'
end

