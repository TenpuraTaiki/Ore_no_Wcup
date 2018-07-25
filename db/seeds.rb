# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Group.create(name: 'A')
Group.create(name: 'B')
Group.create(name: 'C')
Group.create(name: 'D')
Group.create(name: 'E')
Group.create(name: 'F')
Group.create(name: 'G')
Group.create(name: 'H')

Continent.create(name: 'europe', japanese: 'ヨーロッパ')
Continent.create(name: 'africa', japanese: 'アフリカ')
Continent.create(name: 'southamerica', japanese: '南米')
Continent.create(name: 'asia', japanese: 'アジア')
Continent.create(name: 'concacaf', japanese: '北中米カリブ海')
Continent.create(name: 'oceania', japanese: 'オセアニア')

require "csv"

CSV.foreach('db/country.csv') do |row|
    Country.create(:japanese => row[0], :name => row[1], :continent_id => row[2], :fifarank => row[3])
  end