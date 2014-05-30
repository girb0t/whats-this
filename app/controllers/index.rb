get '/' do
  @recent_drawings = Drawing.last(2)
  @recent_descriptions = Description.last(4)
  erb :index
end

post '/signup' do
  # CREATE NEW USER
  user = User.new(username: params[:username], password_digest: params[:password])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    # Error message should check to see if user exists
    session[:last_error] = "There was a problem creating new user."
    redirect '/'
  end
end

post '/login' do
  user = User.find_by_username(params[:username])
  if user && user.authenticate(params[:password])
    redirect '/'
  else
    session[:last_error] = "There was a problem logging in. Please try again."
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

