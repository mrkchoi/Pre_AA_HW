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


# COMMENTS

c1 = Comment.create!(user_id: 1, artwork_id: 3, body: 'Amazing!')
c2 = Comment.create!(user_id: 2, artwork_id: 5, body: 'Beautiful use of color.')
c3 = Comment.create!(user_id: 3, artwork_id: 7, body: 'Unique perspective')
c4 = Comment.create!(user_id: 4, artwork_id: 9, body: 'Speaks volumes')
c5 = Comment.create!(user_id: 5, artwork_id: 1, body: 'Emotionally stirring')

c6 = Comment.create!(user_id: 1, artwork_id: 6, body: 'Blown away by the attention to detail')
c7 = Comment.create!(user_id: 2, artwork_id: 8, body: 'Absolute mastery')
c8 = Comment.create!(user_id: 3, artwork_id: 10, body: 'Craftsmanship is unparalleled')
c9 = Comment.create!(user_id: 4, artwork_id: 2, body: 'Mid-century bliss')
c10 = Comment.create!(user_id: 5, artwork_id: 4, body: 'Intricacies of design')

c11 = Comment.create!(user_id: 1, artwork_id: 5, body: 'Stunning!')
c12 = Comment.create!(user_id: 2, artwork_id: 7, body: 'Visual candy')
c13 = Comment.create!(user_id: 3, artwork_id: 9, body: 'Ordered simplicity')
c14 = Comment.create!(user_id: 4, artwork_id: 1, body: 'Deadass')
c15 = Comment.create!(user_id: 5, artwork_id: 3, body: 'Algorithmic')

c16 = Comment.create!(user_id: 1, artwork_id: 8, body: 'Contagious feeling')
c17 = Comment.create!(user_id: 2, artwork_id: 10, body: 'Wow. Just wow.')
c18 = Comment.create!(user_id: 3, artwork_id: 2, body: 'Do you do custom orders?')
c19 = Comment.create!(user_id: 4, artwork_id: 4, body: 'Like coffee in the morning')
c20 = Comment.create!(user_id: 5, artwork_id: 6, body: 'Reverberating my soul')