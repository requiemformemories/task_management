class Admin::UsersController < ApplicationController
  before_action :authorize
  before_action :get_users, :only => :index
  before_action :get_user, :only => [:show, :edit, :update, :destroy, :password_edit, :password_update]
  
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = t("user.create_success")
      redirect_to :action => :index
    else
      get_users
      render :index
      flash[:alert] = t("user.create_failed")
    end    
  end

  def edit
  end

  def update
    if @user.update(user_update_params)
      flash[:notice] = t("user.update_success")
      redirect_to :action => :index
    else
      flash[:alert] = t("user.update_failed")
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = t("user.delete_success")
    else
      flash[:alert] = t("user.delete_failed")
    end  
    redirect_to :action => :index
  end
  
  def password_edit
  end
  
  def password_update
    if @user.update(user_password_params)
      flash[:notice] = t("user.update_success")
      redirect_to :action => :index
    else
      flash[:alert] = t("user.update_failed")
      render :password_edit
    end
  end
  

private

  def get_users
    @q = User.includes(:tasks).ransack(params[:q])
    @users = @q.result.page(params[:page]).per(10)
  end
  
  def get_user
    id = params[:id] || params[:user_id]
    @user = User.includes(:tasks).find_by_uid(id)
  end

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation, :role)
  end
  
  def user_update_params
    params.require(:user).permit(:name, :username, :role)
  end
  
  def user_password_params
    params.require(:user).permit(:password, :password_confirmation)
  end  
  
  def authorize
    user = User.find_by(uid: session[:user_id])
    unless user
      redirect_to login_url, alert: t("user.not_login_notice")
    end
    
    if user.role != 9
      redirect_to root_url, alert: t("user.auth_failed")
    end
  end
end
