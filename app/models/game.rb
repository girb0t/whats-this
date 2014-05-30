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

end
