class Api::V1::DonesController < ApplicationController
  def index
    @dones = Done.all
    render 'index', formats: :json, handlers: 'jbuilder', layout: false
  end

  def create
    @done = Done.new(content: params[:content])
    @done.save
    render 'show', formats: :json, handlers: 'jbuilder', layout: false
  end
end
