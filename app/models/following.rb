class Following < ApplicationRecord
  belongs_to :user
  belongs_to :follower, :class_name => 'User'
  has_one :playlist, through: :user
end
