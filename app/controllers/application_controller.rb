class ApplicationController < ActionController::Base
  # PrUser CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
      protect_from_forgery with: :exception
      before_action :ensure_current_user


  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id])
    end
  end
``

  helper_method :current_user

  def determine_layout
    current_user ? "application" : "public"
  end

  helper_method :determine_layout

  class AccessDenied < StandardError
  end

  rescue_from AccessDenied, with: :render_404

  def render_404
    render "public/404", status: 404, layout: false
  end

  helper_method :are_you_logged_in

  def are_you_logged_in
    if current_user
    else
      redirect_to signin_path,
      notice: 'You must be logged in to access that action'
    end
  end

  def project_id_match
    project_list = Membership.where(user_id: current_user.id).pluck(:project_id)
    @project = Project.find(params[:id])
    unless project_list.include?(@project.id) || current_user.admin
      raise AccessDenied
    end
  end

helper_method :project_id_match

  def owner_check
    unless current_user.memberships.find_by(
      project_id: @project,
      user_id: current_user,
      role: "owner") || current_user.admin
      raise AccessDenied
    end
  end

  helper_method :owner_check

  # def delete_check
  #   if @project.memberships.where(role: "owner").count > 1
  #   else
  #     redirect_to project_memberships_path(@project, @membership),
  #     notice: "User cannot be deleted right now."
  #   end
  # end
  #
  # helper_method :delete_check


  #

  def ensure_current_user
    unless current_user
      session[:first_url] = request.url if request.get?
      redirect_to signin_path, notice: "You must be logged in to access that action"
    end
  end

  def redirect_to_previous_url_or_projects
    redirect_to (session[:first_url] || projects_path)
    session.delete(:first_url)
  end

end
