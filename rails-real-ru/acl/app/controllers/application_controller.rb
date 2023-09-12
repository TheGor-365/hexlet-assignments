# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include AuthConcern
  include Pundit::Authorization

  helper_method :current_user
  helper_method :post_author?

  # after_action :verify_authorized, except: [:index]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    return unless session[:user_id]

    @user = User.find(session[:user_id])
  end

  def post_author?
    @user.id == @user.posts.first.author.id
  end

  private

  def user_not_authorized
    redirect_to root_path, notice: 'Permission denied'
  end
end
