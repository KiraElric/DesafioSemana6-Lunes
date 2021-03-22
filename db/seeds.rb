# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Creación de data para la bd a traves de la gema faker
Band.destroy_all

50.times do |i|
  band = Band.create(name: Faker::Music.band, members: Random.rand(1...10),
                    debut_date: Date.today + (i+2).days - (i+3).months - (i+4).years,
                    kind: Band.kinds.keys.sample)
  puts "Se creo la banda: #{band.name}"
  rand(10..20).times do |i|
    concert = band.concerts.build(attendance: Random.rand(1000...50000), duration: Random.rand(90...240),
                                  date: Date.today + (i+1).days - (i+2).months - (i).years )
    concert.save
    puts "Se realizó el concierto: #{concert.date}"
  end
end
