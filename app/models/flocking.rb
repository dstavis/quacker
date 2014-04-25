class Flocking < ActiveRecord::Base
  belongs_to :user

  validates_uniqueness_of :user_id, { :scope => :follower_id }
end
