get '/test' do
  @user = User.find(1)
  @game = @user.games.first
  @pictures = Drawing.all
  erb :test
end

get '/test/all_drawings' do
  @drawings = Drawing.all.reverse
  erb :___all_drawings
end