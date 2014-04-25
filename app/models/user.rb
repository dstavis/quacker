class User < ActiveRecord::Base
  has_many :quacks
  has_many :flockings
  has_many :followees, through: :flockings
  has_many :followers, through: :flockings
  validates :username, uniqueness: true

  include BCrypt

  def password
  	@password ||= Password.new(password_hash)
  end

  def password=(new_password)
  	@password = Password.create(new_password)
  	self.password_hash = @password
  end

  def followed_by
    @followers = Flocking.where(followee_id: session[:user_id])
  end

  def follows
    @flock = User.find(session[:user_id])
  end
end
