class User < ActiveRecord::Base
  has_many :participations
  has_many :games, :through => :participations
  
  validates :username, :presence => :true
  validates :password_hash, :presence => :true

  def self.create_user(user)
    User.create(username: user[:username],
                password_hash: BCrypt::Password.create(user[:password]))
  end

  def self.authenticate(params)
    if user = User.find_by_username(params[:username])
      return user if BCrypt::Password.new(user.password_hash) == params[:password]
    end
  end

end
