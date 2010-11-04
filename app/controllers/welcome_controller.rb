class WelcomeController < ApplicationController
  def index
    redirect_to(expertises_path) if current_user? unless params[:noredir]
  end
end
