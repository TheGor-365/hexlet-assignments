# frozen_string_literal: true

# BEGIN
def fibonacci(num)
  return num if (0..1).include? num
  return nil if num.negative?

  fibonacci(num - 1) + fibonacci(num - 2)
end
# END
