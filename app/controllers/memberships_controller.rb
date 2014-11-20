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
    @membership.save
    redirect_to project_memberships_path(@project, @membership)
  end

  def show
  end

  def edit
  end

  def update
    @membership = @project.memberships.find(params[:id])
    @membership.update(params.require(:membership).permit(:project_id, :user_id, :role))
    redirect_to project_memberships_path(@project, @membership)
  end

  def destroy
    @membership = @project.memberships.find(params[:id])
    @membership.destroy
    redirect_to project_memberships_path(@project, @membership)
  end

  private

  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
  end

end
