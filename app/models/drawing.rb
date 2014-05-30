class Drawing < ActiveRecord::Base
  validates :picture, presence: :true
  validates :description_id, uniqueness: :true
  belongs_to :description
  belongs_to :game
  belongs_to :user
  has_one :description
end
