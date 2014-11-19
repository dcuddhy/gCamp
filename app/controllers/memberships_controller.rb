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
    @membership = @project.memberships.find(params[:project_id])
    @membership.save
    redirect_to project_memberships_path(@project, @membership)
  end

  def destroy
  end

  private

  def membership_params
    params.require(:membership).permit(:project_id, :user_id, :role)
  end

end
