class Game < ActiveRecord::Base
  has_many :participations
  belongs_to :winner, :class_name => "User"
  belongs_to :loser, :class_name => "User"
  has_many :users, :through => :participations

end
