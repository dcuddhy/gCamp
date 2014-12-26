class TasksController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end

  before_action :are_you_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]


  def index
    if current_user.memberships.find_by(
      project_id: @project,
      user_id: current_user) || current_user.admin
      if params[:filter]
         @tasks = @project.tasks
      else
         @tasks = @project.tasks.where(complete:"false")
      end
    else
      render "public/404", status: 404, layout: false
    end
  end

  def show
    @comment = @task.comments.new
  end

  def new
    @task = @project.tasks.new
  end

  def edit
  end

  def create
    @task = @project.tasks.new(task_params)
      if @task.save
        redirect_to project_tasks_path(@project, @task), notice: 'Task was successfully created.'
      else
        render :new
    end
  end

  def update
      if @task.update(task_params)
        redirect_to project_tasks_path(@project, @task), notice: 'Task was successfully created.'
      else
        render :edit
    end
  end

  def destroy
    @task.destroy
      redirect_to project_tasks_path(@project, @task), notice: 'Task was successfully destroyed.'
  end

  layout :determine_layout

  private
  
    def set_task
      @task = @project.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :complete, :due_date)
    end

end
