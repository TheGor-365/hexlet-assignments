# frozen_string_literal: true

class Web::RepositoriesController < Web::ApplicationController
  def index
    @repositories = Repository.all
  end

  def new
    @repository = Repository.new
  end

  def show
    @repository = Repository.find params[:id]
  end

  def create
    # BEGIN
    @repository = Repository.new(permitted_params)

    if @repository.save
      redirect_to rapository_url(@repository)
    else
      render :new
    end
    # END
  end

  def update
    # BEGIN
    if @repository.update(permitted_params)
      redirect_to rapository_url(@repository)
    else
      render :edit
    end
    # END
  end

  def update_repos
    # BEGIN
    # @repository = Repository.find params[:id]
    @repositories = Repository.all

    RepositoryLoaderJob.perform_now

    @repositories.each do |repository|
      UpdateStateOperation.new(repository: repository, key: params[:state_key])
    end
    # END
  end

  def destroy
    @repository = Repository.find params[:id]

    if @repository.destroy
      redirect_to repositories_path, notice: t('success')
    else
      redirect_to repositories_path, notice: t('fail')
    end
  end

  private

  def permitted_params
    params.require(:repository).permit(:link)
  end
end
