# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csvrow1 = 1
csvrow2 = 2

CSV.foreach('db/csv/todouhukendata.csv', encoding: "Shift_JIS:UTF-8") do |row|
  prefecture_name = row[csvrow1]
  city_name = row[csvrow2]
  prefecture = Prefecture.find_or_create_by(name: prefecture_name)
  City.find_or_create_by(name: city_name, prefecture_id: prefecture.id)
end