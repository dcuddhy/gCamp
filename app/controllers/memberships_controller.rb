class MembershipsController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end

  def index
    @membership = @project.memberships.new
    @memberships = @project.memberships.all
  end

  def create
    @membership = @project.memberships.new(params.require(:membership).permit(:project_id, :user_id, :role))
    if @membership.save
      redirect_to project_memberships_path(@project, @membership),
      notice: " was successfully added!"
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

    if @membership.update(params.require(:membership).permit(:project_id, :user_id, :role))
      redirect_to project_memberships_path(@project, @membership),
      notice: " was successfully edited!"
    else
      render :index
    end
  end

  def destroy
    @membership = @project.memberships.find(params[:id])
    @membership.destroy
    redirect_to project_memberships_path(@project, @membership),
    notice: " was removed successfully!"
  end

  private

  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
  end

end
