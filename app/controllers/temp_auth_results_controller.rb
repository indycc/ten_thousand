class TempAuthResultsController < ApplicationController
  def index
  end
  def failure
    @message = params[:message]
    @error = request.env['omniauth.error']
  end
  def success
    @provider = params[:provider]
    @auth = request.env['omniauth.auth']
  end
end
