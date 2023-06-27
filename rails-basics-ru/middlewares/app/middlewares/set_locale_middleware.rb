# frozen_string_literal: true

class SetLocaleMiddleware
  
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    @status, @headers, @response = @app.call env

    [ @status, @headers, @response ]
  end
  # END
end
