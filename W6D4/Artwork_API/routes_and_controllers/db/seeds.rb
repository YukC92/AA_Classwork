# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
users1 = User.create(username: 'Gilbert')
users2 = User.create(username: 'Yuk')
users3 = User.create(username: 'Joe')
users4 = User.create(username: 'Gilt')
users5 = User.create(username: 'Gil')
users6 = User.create(username: 'G')

Artwork.destroy_all
art1 = Artwork.create(title: 'Shiba', image_url: 'https://static.boredpanda.com/blog/wp-content/uploads/2017/04/cute-dog-shiba-inu-ryuji-japan-57.jpg', artist_id: users1.id)
art2 = Artwork.create(title: 'American shorthair', image_url: 'https://www.rd.com/wp-content/uploads/2019/05/American-shorthair-cat.jpg', artist_id: users2.id)
art3 = Artwork.create(title: 'Hedgehog', image_url: 'https://static.boredpanda.com/blog/wp-content/uploads/2017/02/cute-hedgehog-photos-7-58930c8af24f3__700.jpg', artist_id: users3.id)

ArtworkShare.destroy_all
artshare1 = ArtworkShare.create(artwork_id: art1.id, viewer_id: users3.id)
artshare2 = ArtworkShare.create(artwork_id: art2.id, viewer_id: users1.id)
artshare3 = ArtworkShare.create(artwork_id: art3.id, viewer_id: users2.id)

Comment.destroy_all
comment1 = Comment.create(artwork_id: art1.id, user_id: users3.id, body: 'This is #1')
comment2 = Comment.create(artwork_id: art2.id, user_id: users1.id, body: 'This is #2')
comment3 = Comment.create(artwork_id: art3.id, user_id: users2.id, body: 'This is #3')
