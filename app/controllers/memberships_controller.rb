class MembershipsController < ApplicationController

  before_action :are_you_logged_in

  before_action do
    @project = Project.find(params[:project_id])
  end


  def index
    if current_user.memberships.find_by(
      project_id: @project,
      user_id: current_user) || current_user.admin
      @membership = @project.memberships.new
      @memberships = @project.memberships.all
    else
      render "public/404", status: 404, layout: false
    end
  end

  def create
    @membership = @project.memberships.new(
      params.require(:membership).permit(
      :project_id,
      :user_id,
      :role))
    if @membership.save
      redirect_to project_memberships_path(@project, @membership),
      notice: " #{@membership.user.full_name} was added successfully!"
    else
      render :index
    end
  end

  def show
    @membership = @project.memberships.find(params[:id])
  end

  def edit
  end

  def update
    @membership = @project.memberships.find(params[:id])
    if @membership.update(params.require(:membership).permit(
      :project_id,
      :user_id,
      :role))
      redirect_to project_memberships_path(@project, @membership),
      notice: " #{@membership.user.full_name} was updated successfully!"
    else
      render :index
    end
  end

  def destroy
    @membership = @project.memberships.find(params[:id])
    if @project.memberships.where(role: "owner").count > 1 || current_user.admin
      @membership.destroy
      redirect_to project_memberships_path(@project, @membership),
      notice: " #{@membership.user.full_name} was removed successfully!"
    elsif @membership.role == "member" && @membership.user.id == current_user.id
      @membership.destroy
      redirect_to projects_path(@project, @membership),
      notice: " #{@membership.user.full_name} was removed successfully!"
    else
      redirect_to project_memberships_path(@project, @membership),
      notice: "User cannot be deleted right now."
    end
  end

  layout :determine_layout

  private

  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
  end

end
