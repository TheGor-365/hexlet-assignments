# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_articles

  def set_articles
    @articles = Article.all
  end
end
