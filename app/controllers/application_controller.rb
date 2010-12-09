class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def deny_access
    flash[:error] = 'You must be logged in to continue.'
    redirect_to root_path
  end
end
