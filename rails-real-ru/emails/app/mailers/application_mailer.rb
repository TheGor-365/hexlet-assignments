# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'gor@mail.com'
  layout 'mailer'
end
