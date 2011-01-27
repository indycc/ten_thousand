class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  protected
  def deny_access
    flash[:error] = t('ccicc.access_denied')
    redirect_to root_path
  end

  def set_locale
    I18n.locale = params[:locale] if params[:locale]
  end

  def default_url_options
    super.merge :locale => I18n.locale
  end
end
