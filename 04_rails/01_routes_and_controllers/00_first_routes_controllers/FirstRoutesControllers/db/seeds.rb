# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# USERS
u1 = User.create!(username: 'mrkchoi')
u2 = User.create!(username: 'cschoi')
u3 = User.create!(username: 'jeannieschoi')
u4 = User.create!(username: 'chrischoi9')
u5 = User.create!(username: 'jkcyohan')

# ARTWORKS

a1 = Artwork.create!(artist_id: 1, title: 'Swan Lake', image_url: '/Swan_lake.jpg')
a2 = Artwork.create!(artist_id: 1, title: 'Notebook', image_url: '/Notebook.jpg')
a3 = Artwork.create!(artist_id: 2, title: 'Traction', image_url: '/Traction.jpg')
a4 = Artwork.create!(artist_id: 2, title: 'Influence', image_url: '/Influence.jpg')
a5 = Artwork.create!(artist_id: 3, title: 'Heart', image_url: '/Heart.jpg')
a6 = Artwork.create!(artist_id: 3, title: 'Zen', image_url: '/Zen.jpg')
a7 = Artwork.create!(artist_id: 4, title: 'Running', image_url: '/Running.jpg')
a8 = Artwork.create!(artist_id: 4, title: 'Peace', image_url: '/Peace.jpg')
a9 = Artwork.create!(artist_id: 5, title: 'Light', image_url: '/Light.jpg')
a10 = Artwork.create!(artist_id: 5, title: 'Rhodia', image_url: '/Rhodia.jog')

# ARTWORKSHARE

as1 = ArtworkShare.create!(artwork_id: 1, viewer_id: 2)
as2 = ArtworkShare.create!(artwork_id: 1, viewer_id: 3)
as3 = ArtworkShare.create!(artwork_id: 2, viewer_id: 4)
as4 = ArtworkShare.create!(artwork_id: 2, viewer_id: 5)
as5 = ArtworkShare.create!(artwork_id: 3, viewer_id: 1)
as6 = ArtworkShare.create!(artwork_id: 3, viewer_id: 3)
as7 = ArtworkShare.create!(artwork_id: 4, viewer_id: 4)
as8 = ArtworkShare.create!(artwork_id: 4, viewer_id: 5)
as9 = ArtworkShare.create!(artwork_id: 5, viewer_id: 1)
as10 = ArtworkShare.create!(artwork_id: 5, viewer_id: 2)
as11 = ArtworkShare.create!(artwork_id: 6, viewer_id: 4)
as12 = ArtworkShare.create!(artwork_id: 6, viewer_id: 5)
as13 = ArtworkShare.create!(artwork_id: 7, viewer_id: 1)
as14 = ArtworkShare.create!(artwork_id: 7, viewer_id: 2)
as15 = ArtworkShare.create!(artwork_id: 8, viewer_id: 3)
as16 = ArtworkShare.create!(artwork_id: 8, viewer_id: 5)
as17 = ArtworkShare.create!(artwork_id: 9, viewer_id: 1)
as18 = ArtworkShare.create!(artwork_id: 9, viewer_id: 2)
as19 = ArtworkShare.create!(artwork_id: 10, viewer_id: 3)
as20 = ArtworkShare.create!(artwork_id: 10, viewer_id: 4)