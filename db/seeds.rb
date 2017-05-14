# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Term.destroy_all
5.times do |i|
  term = Term.create(user: User.first, course: 5 - i, term_number: i)
  5.times do |j|
    subject = Subject.create(name: "Subject #{j}", term: term)
    Lab.create(name: 'Lab 1', subject: subject, state: :done)
    Lab.create(name: 'Lab 2', subject: subject, state: :resolved)
    Lab.create(name: 'Lab 3', subject: subject, state: :in_progress)
    Lab.create(name: 'Lab 4', subject: subject, state: :todo)
  end
end

my_user = User.find_by(email: 'test@mail.com')
my_user.terms.destroy
term = Term.create(user: my_user, course: 3, term_number: 2)
{
  'СПП' => [
    { name: 'Лаба 1: Тема проекта + UML', state: 'done' },
    { name: 'Лаба 2: Каркас приложения', state: 'done' },
    { name: 'Лаба 3: Работающий CRUD', state: 'done' },
    { name: 'Лаба 4: Тесты', state: 'done' },
    { name: 'Лаба 5: Вёрстка', state: 'resolved' },
    { name: 'Лаба 6: Документы', state: 'in_progress' },
    { name: 'Лаба 7: Spring', state: 'todo' },
    { name: 'Лаба 8: Angular', state: 'todo' }
  ],
  'Мобилки' => [
    { name: '1 Swift', state: 'done' },
    { name: '2 Swift', state: 'done' },
    { name: '3 Swift', state: 'done' },
    { name: '4 Swift', state: 'resolved' },
    { name: 'Andoid', state: 'resolved' },
    { name: 'Xamarin', state: 'todo' }
  ],
  'МиАПР' => [
    { name: 'K-means', state: 'done' },
    { name: 'Maximin', state: 'done' },
    { name: 'Clustering error', state: 'done' },
    { name: 'Perceptron', state: 'done' },
    { name: 'Potential Classifier', state: 'done' },
    { name: 'Hierarchical Grouping', state: 'in_progress' },
    { name: 'Syntactic Method', state: 'todo' },
    { name: 'Grammar Generation', state: 'todo' },
    { name: 'Neural Network', state: 'todo' }
  ]
}.each do |subj_name, labs|
  subject = Subject.create(name: subj_name, term: term)
  labs.each { |lab| Lab.create(lab.merge(subject: subject)) }
end
