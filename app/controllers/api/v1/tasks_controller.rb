class Api::V1::TasksController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    user = User.find(current_api_v1_user.id)
    @tasks = user.tasks.all
    render 'index', formats: :json, handlers: 'jbuilder', layout: false
  end

  def create
    @task = Task.create(
      content: task_params[:content],
      user_id: current_api_v1_user.id
    )
    render 'show', formats: :json, handlers: 'jbuilder', layout: false
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(task_params)
    render 'show', formats: :json, handlers: 'jbuilder', layout: false
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    render 'show', formats: :json, handlers: 'jbuilder', layout: false
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end
end
