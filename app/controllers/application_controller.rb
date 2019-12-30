class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  private

  def handle_404
    head :not_found
  end
end
