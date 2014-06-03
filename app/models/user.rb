class User < ActiveRecord::Base

  has_secure_password

  validates :username, presence: :true
  validates_uniqueness_of :username, case_sensitive: false
  validates :password_digest, presence: :true
  has_many :drawings
  has_many :descriptions
  has_many :games

  def get_games
    games = []
    all_game_elements = self.get_all_drawings + self.get_all_descriptions
    all_game_elements.each do |element|
      games << element.game
    end
    games.uniq!
    games
  end

  def get_created_games
    Game.where(user_id: self.id)
  end

  def get_participated_games
    get_games - get_created_games
  end

  def get_all_drawings
    Drawing.where(user_id: self.id)
  end

  def get_all_descriptions
    Description.where(user_id: self.id)
  end

  def get_participated_games_contributions
    contributions = get_all_drawings + get_all_descriptions
    contributions.map! do |element|
      if element.class == Drawing && element.description_id
        element
      elsif element.class == Description && element.drawing_id
        element
      end
    end
    contributions
  end  

  # def get_participated_games_contributions
  #   contributions = get_all_drawings + get_all_descriptions
  #   contributions.map! do |element|
  #     if element.class == Drawing && element.description_id
  #       element.picture
  #     elsif element.class == Description && element.drawing_id
  #       element.body
  #     end
  #   end
  #   contributions
  # end

  # def get_all_first_drawings
  #   user_first_drawings = []
  #   all_drawings = self.get_all_drawings
  #   all_drawings.each do |drawing|
  #     if drawing.description_id == nil
  #       user_first_drawings << drawing
  #     end
  #   end
  # end 

  # def get_all_first_descriptions
  #   user_first_descriptions = []
  #   all_descriptions = self.get_all_descriptions
  #   all_descriptions.each do |description|
  #     if description.drawing_id == nil
  #       user_first_descriptions << description
  #     end
  #   end
  # end

end
