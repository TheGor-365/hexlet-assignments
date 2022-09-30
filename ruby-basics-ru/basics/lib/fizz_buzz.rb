# frozen_string_literal: true

# BEGIN

def fizz_buzz(start, stop)
  return if start > stop
  result = []

  while start <= stop
    result << get_value(start)
    start += 1
  end
  result.join(' ')
end

def get_value(num)
  if (num % 3).zero? && (num % 5).zero?
    'FizzBuzz'
  elsif (num % 5).zero?
    'Buzz'
  elsif (num % 3).zero?
    'Fizz'
  else
    num
  end
end
# END
