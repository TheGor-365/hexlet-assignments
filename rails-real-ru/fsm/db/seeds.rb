100.times do |number|
  vacancy = Vacancy.create(
    title:       Faker::Job.position,
    description: Faker::Job.title
  )
  puts "Create vacancy\t - #{vacancy}\t\t number - #{number.next}"
end
