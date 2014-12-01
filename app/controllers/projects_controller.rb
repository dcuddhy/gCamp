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
    if @project.save
      redirect_to project_tasks_path(@project), notice: 'Project was successfully created.'
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


private
  def determine_layout
    current_user ? "private" : "application"
  end


end
