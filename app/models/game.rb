class Game < ActiveRecord::Base
  belongs_to :user
  has_many :drawings
  has_many :descriptions
end
