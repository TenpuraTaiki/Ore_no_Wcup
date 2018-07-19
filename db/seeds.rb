# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Continent.create(name: 'Europe')
Continent.create(name: 'Africa')
Continent.create(name: 'South-America')
Continent.create(name: 'Asia')
Continent.create(name: 'Concacaf')
Continent.create(name: 'Oceania')

require "csv"

CSV.foreach('db/country.csv') do |row|
    Country.create(:japanese => row[0], :name => row[1], :continent_id => row[2], :fifarank => row[3])
  end