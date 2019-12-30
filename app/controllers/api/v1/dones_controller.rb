class Api::V1::DonesController < ApplicationController
  def index
    @dones = Done.all
    render 'index', formats: :json, handlers: 'jbuilder', layout: false
  end

  def create
    @done = Done.create(content: params[:content])
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
