# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Term.destroy_all
5.times do |i|
  term = Term.create(user: User.first, course: 5 - i, number: i)
  5.times do |j|
    subject = Subject.create(name: "Subject #{j}", term: term)
    5.times do |k|
      Lab.create(name: "Lab #{k}", subject: subject)
    end
  end
end