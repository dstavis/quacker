class Flocking < ActiveRecord::Base
  belongs_to :user

  #validates_uniqueness_of :follower_id, { :scope => :user_id }
end
