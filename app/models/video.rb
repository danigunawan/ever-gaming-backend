class Video < ApplicationRecord
  has_many :video_playlists
  has_many :playlists, through: :video_playlists
end
