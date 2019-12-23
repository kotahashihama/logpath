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

  def edit
    @done = Done.find(params[:id])
  end

  def update
    @done = Done.find(params[:id])
    @done.update(done_params)
    @done.save

    redirect_to @done
  end

  def destroy
    @done = Done.find(params[:id])
    @done.destroy

    redirect_to dones_path
  end

  def show
    @done = Done.find(params[:id])
  end

  def done_params
    params.require(:done).permit(:content)
  end
end
