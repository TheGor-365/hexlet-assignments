# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  def index?
    true
  end

  def new?
    create?
  end

  def create?
    user
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    user.admin || record.author_id == user&.id
  end

  def destroy?
    user.admin
  end
  # END
end
