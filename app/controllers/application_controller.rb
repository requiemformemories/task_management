class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :set_locale
  
    
  def set_locale
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end
    I18n.locale = session[:locale] || I18n.default_locale
  end
  
  private
  def authorize
    unless User.find_by(uid: session[:user_id])
      redirect_to login_url, notice: t("user.not_login_notice")
    end
  end
  
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(uid: session[:user_id])
    else
      @current_user = nil
    end
  end  

end
