class SessionsController < ApplicationController
  def new
    if !session[:user_id].nil?
      redirect_to root_url
    end
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user and user.authenticate(params[:session][:password])
      session[:user_id] = user.uid
      redirect_to tasks_path, notice: t('user.login_success')
    else
      @auth = params[:password]
      redirect_to login_url, alert: t('user.login_failed')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: t('user.logged_out_notice')
  end
end
