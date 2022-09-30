# frozen_string_literal: true

# rubocop:disable Style/For

def make_censored(text, stop_words)
  # BEGIN
  sentence = []
  
  for word in text.split(' ')
    stop_words.include?(word) ? (sentence << '$#%!') : (sentence << word)
  end
  sentence.join(' ')
  # END
end

# rubocop:enable Style/For
