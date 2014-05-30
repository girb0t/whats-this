get '/' do
  erb :index
end

post '/signup' do
  # CREATE NEW USER
  user = User.new(username: params[:username], password_digest: params[:password])
  if user.save
    session[:user_id] = user.id
    redirect '/users/profile'
  else
    # Error message should check to see if user exists
    session[:last_error] = "There was a problem creating new user."
    redirect '/'
  end
end

post '/login' do
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

