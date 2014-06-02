helpers do
  
  # def get_first_elements(game_array)
  #   first_elements = []
  #   game_array.each do |game|
  #     first_elements << game.get_first_game_element
  #   end
  #   first_elements.map! do |e|
  #     if e.class == Drawing
  #       e.picture
  #     else
  #       e.body
  #     end #if
  #   end #map
  #   first_elements
  # end #def  

  def get_first_elements(game_array)
    first_elements = []
    game_array.each do |game|
      first_elements << game.get_first_game_element
    end
    first_elements
  end #def

  def get_thumbnails_from_drawing_array(drawing_array)
    thumbnails = []
    drawing_array.each do |drawing|
      thumbnails << drawing.thumbnail
    end
    thumbails
  end

end