class Drawing < ActiveRecord::Base
  validates :picture, presence: :true
  validates :description_id, uniqueness: :true, :allow_nil => true
  belongs_to :description
  belongs_to :game
  belongs_to :user
  has_one :description

  def thumbnail
    svg = self.picture
    svg.gsub!(/width="\d+"/, 'width="300"')
    svg.gsub!(/height="\d+"/, 'height="300" viewBox="0 0 400 400"')
    svg
  end
end
