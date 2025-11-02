class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def show
    @task = target_task params[:id]
  end

  def new
    @task = Task.new
  end

  def edit
    @taks = current_user.tasks.new task_params
    @task.save!
    redirect_to @task
  end

  def update
    @task = target_task params[:id]
    @task.update(task_params)
  end

  def destroy
    @task = target_task params[:id]
    @task.destroy
    redirect_to @task
  end

  private
  def target_task task_id
    current_user.tasks.where(id: task_id).take
  end

  def task_params
    params.require(:task).permit(:title, :description)
  end
end
