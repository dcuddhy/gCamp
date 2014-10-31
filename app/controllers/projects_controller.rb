class ProjectsController <ApplicationController

  def index
    @projects = Project.all.order(:name)
  end

  def new
    @project = Project.new
  end

def show
  @project = Project.find(params[:id])
end

  def create
    project_params = params.require(:project).permit(:name)
    @project = Project.new(project_params)
    @project.save
    redirect_to @project, notice: 'Project was successfully created.'
  end


  def edit
    @project = Project.find(params[:id])

  end

  def update
    project_params = params.require(:project).permit(:name)
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to @project, notice: 'Project was successfully edited.'
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, notice: 'Project was successfully deleted.'
  end


end
