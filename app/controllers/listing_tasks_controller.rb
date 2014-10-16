class ListingTasksController < ApplicationController
  before_action :set_listing_task, only: [:show, :edit, :update, :destroy]

  # GET /listing_tasks
  # GET /listing_tasks.json
  def index
    @listing_tasks = ListingTask.all
  end

  # GET /listing_tasks/1
  # GET /listing_tasks/1.json
  def show
  end

  # GET /listing_tasks/new
  def new
    @listing_task = ListingTask.new
  end

  # GET /listing_tasks/1/edit
  def edit
  end

  # POST /listing_tasks
  # POST /listing_tasks.json
  def create
    @listing_task = ListingTask.new(listing_task_params)

    respond_to do |format|
      if @listing_task.save
        format.html { redirect_to @listing_task, notice: 'Listing task was successfully created.' }
        format.json { render :show, status: :created, location: @listing_task }
      else
        format.html { render :new }
        format.json { render json: @listing_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listing_tasks/1
  # PATCH/PUT /listing_tasks/1.json
  def update
    respond_to do |format|
      if @listing_task.update(listing_task_params)
        format.html { redirect_to @listing_task, notice: 'Listing task was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing_task }
      else
        format.html { render :edit }
        format.json { render json: @listing_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listing_tasks/1
  # DELETE /listing_tasks/1.json
  def destroy
    @listing_task.destroy
    respond_to do |format|
      format.html { redirect_to listing_tasks_url, notice: 'Listing task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing_task
      @listing_task = ListingTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_task_params
      params.require(:listing_task).permit(:description)
    end
end
