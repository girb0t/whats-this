class Game < ActiveRecord::Base
  belongs_to :user
  has_many :drawings
  has_many :descriptions

  def get_game_elements
  	game_parts = Drawing.where(game_id: self.id)
  	game_parts << Description.where(game_id: self.id)
  	game_parts.flatten!

  	@sorted_game_parts = game_parts.sort_by &:created_at
  end	

  def get_last_game_element
    get_game_elements.pop
  end


  def self.get_all_last_drawings
    last_drawings = []
    self.all.each do |game|
      if game.get_last_game_element.class == Drawing
        last_drawings << game.get_last_game_element
      end
    end
    last_drawings = last_drawings.sort_by &:created_at
    last_drawings.reverse
  end  

  def self.get_all_last_descriptions
    last_descriptions = []
    self.all.each do |game|
      if game.get_last_game_element.class == Description
        last_descriptions << game.get_last_game_element
      end
    end
    last_descriptions = last_descriptions.sort_by &:created_at
    last_descriptions.reverse
  end


end
