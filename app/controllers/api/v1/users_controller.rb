class Api::V1::UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:username])
    render 'show', formats: :json, handlers: 'jbuilder', layout: false
  end
end
