# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chris = User.create(username: 'ccankov')
steven = User.create(username: 'sli')

artwork1 = Artwork.create(title: 'Stick Figure',
                          image_url: 'fake.com/stickfigure.jpg',
                          artist_id: chris.id)
artwork2 = Artwork.create(title: 'Mona Lisa',
                          image_url: 'fake.com/mona.jpg',
                          artist_id: steven.id)
artwork3 = Artwork.create(title: 'Puppies',
                          image_url: 'fake.com/pups.jpg',
                          artist_id: chris.id)

a1share = ArtworkShare.create(artwork_id: artwork1.id, viewer_id: steven.id)
a2share = ArtworkShare.create(artwork_id: artwork2.id, viewer_id: chris.id)
