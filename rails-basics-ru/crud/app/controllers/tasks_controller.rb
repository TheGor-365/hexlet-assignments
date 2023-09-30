class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def index
    @tasks = Task.all
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to task_url(@task)
      flash[:notice] = "Task successfully created"
    else
      render :new, status: :unprocessable_entity
      flash[:alert] = "Post is not created"
    end
  end

  def update
    if @task.update(task_params)
      redirect_to task_url(@task)
      flash[:notice] = "Post successfully updated"
    else
      render :edit
      flash[:alert] = "Post is not updated"
    end
  end

  def destroy
    @task.destroy

    redirect_to tasks_url
    flash[:notice] = "Post successfully deleted"
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(
      :name,
      :description,
      :status,
      :creator,
      :performer,
      :completed
    )
  end
end
