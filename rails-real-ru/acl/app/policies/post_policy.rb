# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    @user.present?
  end

  def new?
    create?
  end

  def update?
    @post.author_id == @user&.id || @user.admin?
  end

  def destroy?
    @user.admin?
  end

  def resolve
    if user.admin?
      scope.all
    else
      raise Pundit::NotAuthorizedError, 'not allowed to view this action'
    end
  end
  # END
end
