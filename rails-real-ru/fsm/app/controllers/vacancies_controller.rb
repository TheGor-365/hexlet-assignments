# frozen_string_literal: true

class VacanciesController < ApplicationController
  before_action :set_vacancy, only: %I[publish archive]

  def index
    @on_moderate = Vacancy.on_moderate
    @published = Vacancy.published
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)

    if @vacancy.save
      redirect_to vacancies_path, notice: 'Vacancy was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # BEGIN
  def publish
    if @vacancy.on_moderate?
      @vacancy.publish!
      redirect_to root_path, notice: 'Vacancy was published successfully'
    else
      render :index, notice: 'There are some error'
    end
  end

  def archive
    if @vacancy.published?
      @vacancy.archive!
      redirect_to root_path, notice: 'Vacancy was archived successfully'
    else
      render :index, notice: 'There are some error'
    end
  end
  # END

  private

  def set_vacancy
    @vacancy = Vacancy.find(params[:id])
  end

  def vacancy_params
    params.require(:vacancy).permit(:title, :description)
  end
end
