class User < ApplicationRecord
  has_secure_password
  has_one :playlist
  has_many :followers, :class_name => 'Following', :foreign_key => 'user_id'
  has_many :following, :class_name => 'Following', :foreign_key => 'follower_id'

  validates :username, presence: true, uniqueness: { case_sensitive: false }

end
