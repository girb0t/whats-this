require 'faker'

def create_user(username = Faker::Name.first_name)
  user = User.create(username: username, password: 'yolo', password_confirmation: 'yolo')
  user
end

def create_drawing(user_id, game_id, description_id=nil)
  svg = "<svg x=\"0\" y=\"0\" width=\"699.54546\" height=\"298.31819\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><g fill=\"none\" stroke=\"#9cff59\" stroke-width=\"5\" stroke-linecap=\"butt\" stroke-linejoin=\"miter\" stroke-miterlimit=\"10\" stroke-dasharray=\"\" stroke-dashoffset=\"0\" font-family=\"sans-serif\" font-weight=\"normal\" font-size=\"12\" text-anchor=\"start\" mix-blend-mode=\"normal\"><polyline points=\"151.54546,250.31819 150.54546,250.31819 149.54546,248.31819 147.54546,239.31819 146.54546,227.31819 147.54546,196.31819 155.54546,164.31819 169.54546,138.31819 189.54546,115.31819 210.54546,98.31819 223.54546,95.31819 238.54546,94.31819 248.54546,96.31819 253.54546,111.31819 254.54546,143.31819 248.54546,177.31819 225.54546,213.31819 189.54546,246.31819 168.54546,255.31819 132.54546,260.31819 109.54546,260.31819 89.54546,249.31819 73.54546,228.31819 69.54546,197.31819 72.54546,170.31819 94.54546,139.31819 104.54546,131.31819 119.54546,125.31819 137.54546,123.31819 145.54546,123.31819 151.54546,129.31819 154.54546,130.31819\"/></g></svg>"
  drawing = Drawing.create(picture: svg, user_id: user_id, game_id: game_id, description_id: description_id)
  drawing
end

def create_description(user_id, game_id, drawing_id=nil)
  body = Faker::Lorem.sentence
  description = Description.create(body: body, user_id: user_id, game_id: game_id, drawing_id: drawing_id)
  description
end

pei = create_user('pei')
bev = create_user('bev')
stephen = create_user('stephen')
tanner = create_user('tanner')
nikola = create_user('nikola')

users = [pei, bev]
users_other = [stephen, tanner, nikola]

users.each do |user|
  game = Game.create(user_id: user.id, is_complete: false)
  # description = create_description(user.id, game.id)
  description = Description.create(body: "FIRST DESCRIPTION", user_id: user.id, game_id: game.id, drawing_id: nil)
end

users_other.each do |user|
  svg = "<svg x=\"0\" y=\"0\" width=\"699.54546\" height=\"298.31819\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\"><g fill=\"none\" stroke=\"#9cff59\" stroke-width=\"5\" stroke-linecap=\"butt\" stroke-linejoin=\"miter\" stroke-miterlimit=\"10\" stroke-dasharray=\"\" stroke-dashoffset=\"0\" font-family=\"sans-serif\" font-weight=\"normal\" font-size=\"12\" text-anchor=\"start\" mix-blend-mode=\"normal\"><polyline points=\"151.54546,250.31819 150.54546,250.31819 149.54546,248.31819 147.54546,239.31819 146.54546,227.31819 147.54546,196.31819 155.54546,164.31819 169.54546,138.31819 189.54546,115.31819 210.54546,98.31819 223.54546,95.31819 238.54546,94.31819 248.54546,96.31819 253.54546,111.31819 254.54546,143.31819 248.54546,177.31819 225.54546,213.31819 189.54546,246.31819 168.54546,255.31819 132.54546,260.31819 109.54546,260.31819 89.54546,249.31819 73.54546,228.31819 69.54546,197.31819 72.54546,170.31819 94.54546,139.31819 104.54546,131.31819 119.54546,125.31819 137.54546,123.31819 145.54546,123.31819 151.54546,129.31819 154.54546,130.31819\"/></g></svg>"
  game = Game.create(user_id: user.id, is_complete: false)
  # description = create_description(user.id, game.id)
  drawing = Drawing.create(picture: svg, user_id: user.id, game_id: game.id, description_id: nil)
end

users.each do |user|
  user.games.each do |game|
    10.times do
      player = create_user
      player2 = create_user
      game_descriptions = Description.where(game_id: game.id)
      last_description = game_descriptions.last
      last_description_id = last_description.id
      new_drawing = create_drawing(player.id, game.id, last_description_id)
      new_description = create_description(player2.id, game.id, new_drawing.id)
    end
  end
end

users_other.each do |user|
  user.games.each do |game|
    10.times do
      player = create_user
      player2 = create_user
      game_drawings = Drawing.where(game_id: game.id)
      last_drawing = game_drawings.last
      last_drawing_id = last_drawing.id
      new_description = create_description(player.id, game.id, last_drawing_id)
      new_drawing = create_drawing(player2.id, game.id, new_description.id)
    end
  end
end

