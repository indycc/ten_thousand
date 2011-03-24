class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  protected
  def deny_access
    flash[:error] = t('ccicc.access_denied')
    redirect_to root_path
  end

  def set_locale
    locale = params[:locale] || session[:locale]
    if locale && I18n.available_locales.include?(locale.to_sym)
      I18n.locale = session[:locale] = locale
    end
  end
end
