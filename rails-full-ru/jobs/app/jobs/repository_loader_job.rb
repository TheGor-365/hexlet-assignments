class RepositoryLoaderJob < ApplicationJob
  queue_as :default

  def perform
    repository = Repository.find_by_id(:id)

    UpdateStateOperation.new
  end
end
