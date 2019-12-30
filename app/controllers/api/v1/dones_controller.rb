class Api::V1::DonesController < ApplicationController
  def index
    render json: {
      msg: 'done'
    }
  end
end
