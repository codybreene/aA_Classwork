# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{username: "Matt"}, {username: "Cody"}, {username: "LeBronJames"}])
artworks = Artwork.create([{title: "Blue Dog", image_url: "bluedog.com", artist_id: 3}, {title: "Red Dog", image_url: "reddog.com", artist_id: 3}, {title: "Green Fish", image_url: "greenfish.com", artist_id: 5 }, {title: "Blue Fish", image_url: "bluefishy.com", artist_id: 6}])

artwork_shares = ArtworkShare.create([{artwork_id: 4,viewer_id: 3}, {artwork_id: 6,viewer_id: 5}, {artwork_id: 7,viewer_id: 8}])