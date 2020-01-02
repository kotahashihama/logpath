class Api::V1::DonesController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    user = User.find(current_api_v1_user.id)
    @dones = user.dones.all
    render 'index', formats: :json, handlers: 'jbuilder', layout: false
  end

  def create
    @done = Done.create(
      content: params[:content],
      user_id: current_api_v1_user.id
    )
    render 'show', formats: :json, handlers: 'jbuilder', layout: false
  end

  def update
    @done = Done.find(params[:id])
    @done.update_attributes(content: params[:content])
    render 'show', formats: :json, handlers: 'jbuilder', layout: false
  end

  def destroy
    @done = Done.find(params[:id])
    @done.destroy
    render 'show', formats: :json, handlers: 'jbuilder', layout: false
  end
end
