class User < ActiveRecord::Base
  validates :username, presence: :true, uniqueness: :true
  validates :password_digest, presence: :true
  has_many :drawings
  has_many :descriptions
  has_many :games

end
