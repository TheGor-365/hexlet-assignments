# frozen_string_literal: true

# BEGIN
def anagramm_filter(basic_word, list)
  sorted_word = chars_sort(basic_word)

  list.each_with_object([]) do |word, array|
    array << word if chars_sort(word) == sorted_word
  end
end

def chars_sort(word)
  word.chars.sort
end
# END
