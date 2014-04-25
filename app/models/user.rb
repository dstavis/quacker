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
   # create a var for session[:user_id]
  def followed_by user_id
    @followers = Flocking.where(followee_id: user_id )
  end

  # same for session[:user_id]
  def follows user_id
    @flock = User.find( user_id )
  end
end
