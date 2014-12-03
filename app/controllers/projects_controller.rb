class ProjectsController <ApplicationController

  before_action :are_you_logged_in

  def index
      @projects = Project.all.order(:name)
  end

  def new
      @project = Project.new
  end

  def show
    if
      @project = Project.find(params[:id])
    else
      redirect_to signin_path, notice: 'You are not a member of this project.'
    end

  end

  def create
      project_params = params.require(:project).permit(:name)
      @project = Project.new(project_params)
      if @project.save
        redirect_to project_tasks_path(@project), notice: 'Project was successfully created.'
        Membership.create(project_id: @project.id, user_id: current_user.id, role: "owner")
      else
        render :new
      end
  end


  def edit
      @project = Project.find(params[:id])
  end

  def update
      @project = Project.find(params[:id])
      if @project.update(params.require(:project).permit(:name))
        redirect_to project_tasks_path(@project), notice: 'Project was successfully edited.'
      else
        render :edit
      end
  end

  def destroy
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to projects_path, notice: 'Project was successfully deleted.'
  end

  layout :determine_layout

end
