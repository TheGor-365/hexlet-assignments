# frozen_string_literal: true

# BEGIN
def count_by_years(users)
  males = users.filter { |user| user[:gender] == 'male' }
  years = males.map { |male| male[:birthday][0, 4] }

  years.each_with_object(Hash.new(0)) do |year, hash|
    hash[year] += 1
  end
end
# END
