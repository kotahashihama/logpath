class DonesController < ApplicationController
  def index
    @dones = Done.all
  end

  def new
    @done = Done.new
  end

  def create
    @done = Done.new(done_params)
    @done.save

    redirect_to @done
  end

  def show
    @done = Done.find(params[:id])
  end

  def done_params
    params.require(:done).permit(:content)
  end
end
