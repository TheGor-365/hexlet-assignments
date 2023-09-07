# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include AuthConcern
  include Pundit::Authorization

  helper_method :current_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    return unless session[:user_id]

    @user = User.find(session[:user_id])
  end

  private

  def user_not_authorized
    redirect_to root_path
  end
end
