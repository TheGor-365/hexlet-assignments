# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def account_activation
    # BEGIN
    @user = params[:user]
    @user_name = params[:user_name]

    mail(
      subject: t('user_mailer.account_activation.subject'),
      to: email_address_with_name(@user.email, @user.name)
    )
    # END
  end
end
