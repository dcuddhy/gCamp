class UsersController < ApplicationController

  before_action :are_you_logged_in
  before_action :require_self, only: [:edit, :update, :destroy]



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
      :pivotal_tracker_token)
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

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(
    :first_name,
    :last_name,
    :email,
    :password,
    :password_confirmation,
    :pivotal_tracker_token
    )
  end


  def require_self
    unless user.id == current_user.id
      render file: 'public/404.html', status: :not_found, layout: false
    end
  end



end
