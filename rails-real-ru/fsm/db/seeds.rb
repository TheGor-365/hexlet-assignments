30.times do |number|
  vacancy = Vacancy.create(
    title:       Faker::Job.position,
    description: Faker::Lorem.sentence
  )
  puts "Create vacancy\t - #{vacancy.title}\t\t number - #{number.next}"
end
