class TasksController < ApplicationController

  before_action do
    @project = Project.find(params[:project_id])
  end

  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:filter]
       @tasks = @project.tasks
    else
       @tasks = @project.tasks.where(complete:"false")
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
      redirect_to project_tasks_path(@project, @suitcase), notice: 'Task was successfully destroyed.'
  end

  private
    def set_task
      @task = @project.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:description, :complete, :due_date)
    end





end
