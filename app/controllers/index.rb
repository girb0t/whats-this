get '/' do
  @recent_descriptions = Game.get_all_last_descriptions_of_inprogress
  @recent_drawings = Game.get_all_last_drawings_of_inprogress
  if session[:last_error]
    @error = session[:last_error]
  end
  erb :index
end

post '/signup' do
  user = User.new(username: params[:username], password: params[:password], password_confirmation: params[:password])
  if user.save  
    session[:user_id] = user.id
    session[:username] = user.username
    redirect '/'
  elsif User.find(:first, :conditions => ["lower(username) = ?", params[:username].downcase])
    session[:last_error] = "That username is already taken. Please try again."
    redirect '/'
  else
    session[:last_error] = "There was a problem creating new user."
    redirect '/'
  end
end

post '/login' do
  user = User.find_by_username(params[:username])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    session[:username] = user.username
    redirect '/'
  else 
    session[:last_error] = "Problem logging in.  Please check your username and password and try again.  NOTE: Usernames are case-sensitive."
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

