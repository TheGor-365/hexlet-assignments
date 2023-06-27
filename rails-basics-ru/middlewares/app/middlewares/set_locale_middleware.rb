# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    @status, @headers, @response = @app.call env

    I18n.locale == :ru ? (root_path = 'home/index.ru.html.slim') : (root_path = 'home/index.en.html.slim')

    [@status, @headers, @response]
  end
  # END
end
