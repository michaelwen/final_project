class User < ActiveRecord::Base
  belongs_to :followers
  belongs_to :playlists
  belongs_to :following
end
