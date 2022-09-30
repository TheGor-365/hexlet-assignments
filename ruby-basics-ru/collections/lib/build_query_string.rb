# frozen_string_literal: true

# rubocop:disable Style/For
# BEGIN
def build_query_string(options)
  query = []

  for pair in options.sort
    query << "#{pair[0]}=#{pair[1]}"
  end
  query.join('&')
end
# END
# rubocop:enable Style/For
