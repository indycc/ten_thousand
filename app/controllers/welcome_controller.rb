class WelcomeController < ApplicationController
  layout false

  def index
    redirect('/TODO') if current_user?
  end
end
