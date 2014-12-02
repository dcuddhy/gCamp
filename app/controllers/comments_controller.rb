class CommentsController <ApplicationController

before_action do
  @task = Task.find(params[:task_id])
  @project = Project.find(params[:project_id])
end


  def create
    comment_params = params.require(:comment).permit(:details)
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.task_id = @task.id
    if @comment.save
      redirect_to project_task_path(@project, @task), notice: 'Comment was successfully created.'
    else
      redirect_to project_task_path(@project, @task)
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(params.require(:comment).permit(:details))
      redirect_to @comment, notice: 'Comment was successfully edited.'
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path, notice: 'Comment was successfully deleted.'
  end

  layout :determine_layout


  private
  def determine_layout
    current_user ? "application" : "public"
  end

end
