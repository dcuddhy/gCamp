class ProjectsController <ApplicationController

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    project_params = params.require(:project).permit(:name)
    @project = Project.new(project_params)
    @project.save
    redirect_to projects_path, notice: 'User was successfully created.'
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    project_params = params.require(:project).permit(:name)
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to projects_path
  end

def destroy
  @project = Project.find(params[:id])
  @project.destroy
  redirect_to projects_path
end

end
