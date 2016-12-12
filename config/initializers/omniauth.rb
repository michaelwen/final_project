require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "d9ad5a779ea445379831932ed05aef00", "f5877b0d22214d74908d3780e8b9bfbb", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end