class Game < ActiveRecord::Base
  belongs_to :user
  has_many :drawings
  has_many :descriptions

  def check_finished
    if get_game_elements.count >= 10
      self.update_attribute("is_complete", true)
    end
  end

  def get_game_elements
  	game_elements = Drawing.where(game_id: self.id)
  	game_elements << Description.where(game_id: self.id)
  	game_elements.flatten!

  	@sorted_game_elements = game_elements.sort_by &:created_at
  end	

  def get_timeline
    game_elements = get_game_elements
    game_elements.map! do |element|
      if element.class == Drawing
        element
      else
        element
      end
    end
    game_elements
  end

  def get_last_game_element
    get_game_elements.pop
  end

  def get_first_game_element
    get_game_elements.shift
  end


  def self.get_all_last_drawings_of_inprogress
    last_drawings = []
    self.all.each do |game|
      if game.get_last_game_element.class == Drawing && !game.is_complete
        last_drawings << game.get_last_game_element
      end
    end
    last_drawings = last_drawings.sort_by &:created_at
    last_drawings.reverse
  end  

  def self.get_all_last_descriptions_of_inprogress
    last_descriptions = []
    self.all.each do |game|
      if game.get_last_game_element.class == Description && !game.is_complete
        last_descriptions << game.get_last_game_element
      end
    end
    last_descriptions = last_descriptions.sort_by &:created_at
    last_descriptions.reverse
  end

  def self.get_all_first_drawings
    first_drawings = []
    self.all.each do |game|
      if game.get_first_game_element.class == Drawing
        first_drawings << game.get_first_game_element
      end
    end
    first_drawings = first_drawings.sort_by &:created_at
    first_drawings.reverse
  end  

  def self.get_all_first_descriptions
    first_descriptions = []
    self.all.each do |game|
      if game.get_first_game_element.class == Description
        first_descriptions << game.get_first_game_element
      end
    end
    first_descriptions = first_descriptions.sort_by &:created_at
    first_descriptions.reverse
  end


end
