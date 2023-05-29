10.times do |index|
  number = index + 1

  Task.create(
    name:        Faker::Lorem.sentence,
    description: Faker::Lorem.paragraphs.join("\n"),
    status:      "new #{index + 1}",
    creator:     Faker::Name.name,
    performer:   Faker::Name.name,
    completed:   Faker::Boolean.boolean
  )
end
