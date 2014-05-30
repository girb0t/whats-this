class Description < ActiveRecord::Base
  validates :body, presence: :true
  validates :drawing_id, uniqueness: :true, :allow_nil => true
  belongs_to :user
  belongs_to :drawing
  belongs_to :game
  has_one :drawing
end
