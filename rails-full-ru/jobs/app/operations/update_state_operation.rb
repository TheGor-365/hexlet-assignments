class UpdateStateOperation
  def call(repository:, key:)
    case key
    when Repository::STATE_CREATED  then repository.fetching!
    when Repository::STATE_FETCHING then repository.fetched!
    when Repository::STATE_FETCHED  then repository.failed!
    when Repository::STATE_FAILED   then repository.created!
    end
  end
end
