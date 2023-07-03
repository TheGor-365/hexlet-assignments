require 'csv'
require 'date'

namespace :hexlet do
  desc "Imports Users from CSV file to database"

  task :import_users, [:path] => :environment do |rake_task, csv|
    puts "Task started"

    csv_file = []
    csv_path = csv[:path]

    CSV.parse(File.read(csv_path)) do |row|
      csv_file << row
    end
    csv_file.delete_at 0
    pp csv_file

    csv_file.each do |data_row|
      first_name  = data_row[0]
      last_name   = data_row[1]
      birthday    = data_row[2]
      email       = data_row[3]

      user = User.find_or_create_by(
        first_name: first_name,
        last_name:  last_name,
        birthday:   Date.strptime(birthday, '%m/%d/%Y'),
        email:      email
      )

      puts "Created #{user.first_name}"
    end
  end

  puts "Task done"
end
