namespace :db do
  desc "Clear the DB and fill with excellent sample data"
  task populate: :environment do
    require 'faker'

    # Clear the Database
    [Song, Album, Artist, Genre].each do |model|
      model.delete_all
    end

    # Add Genres, Artists, and Songs
    5.times do
      genre = Genre.create(name: Faker::HitchhikersGuideToTheGalaxy.specie)

      rand(5..10).times do
        artist = Artist.create(name: Faker::StarWars.vehicle,
                               bio: Faker::Hipster.paragraph(5, true, 4),
                               genre_id: genre.id)

        rand(3..6).times do
          album = Album.create(name: Faker::Book.title,
                               artist_id: artist.id)

          rand(10..20).times do
            song = Song.create(name: Faker::Company.catch_phrase,
                               album_id: album.id)
          end
        end
      end
    end

    puts "BOOYA! Populated!"

  end
end