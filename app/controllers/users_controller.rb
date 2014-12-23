class UsersController < ApplicationController

  before_action :are_you_logged_in
  before_action :require_self, only: [:edit, :update, :destroy]
  before_action :authorize_admin, only: [:new, :create]


  def index
      @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
      @user = User.find(params[:id])
  end

  def create
    Rails.logger.info("In users#create: " + params.inspect)

    @user = User.new(params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :pivotal_tracker_token,
      :admin)
      )
    if @user.save
      redirect_to users_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path, notice: 'User was successfully updated.'
      else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User was successfully deleted"
  end

  layout :determine_layout

  private

  def user
    @user = User.find(params[:id])
  end

  def user_params
    if current_user.admin
      params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :pivotal_tracker_token,
      :admin
      )
    else
      params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
      :pivotal_tracker_token,
      )
    end
  end

  def require_self
    unless user.id == current_user.id || current_user.admin
      render file: 'public/404.html', status: :not_found, layout: false
    end
  end

  def authorize_admin
    unless current_user.admin
      raise AccessDenied
    end
  end

end
