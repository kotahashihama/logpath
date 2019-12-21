class DonesController < ApplicationController
  def index
    @dones = Done.all
  end
end
