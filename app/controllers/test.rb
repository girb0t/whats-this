get '/test' do
  @user = User.find(1)
  @game = @user.games.first
  @pictures = Drawing.all
  erb :test
end