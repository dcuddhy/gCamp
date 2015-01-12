class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :ensure_current_user

  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id]) || current_user.admin
    end
  end

  helper_method :current_user


  class AccessDenied < StandardError
  end

  rescue_from AccessDenied, with: :render_404

  def render_404
    render "public/404", status: 404, layout: false
  end


  def are_you_logged_in
    if current_user
    else
      redirect_to signin_path,
      notice: 'You must be logged in to access that action'
    end
  end

  helper_method :are_you_logged_in


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
      role: "owner") || current_user.admin
    raise AccessDenied
    end
  end


  helper_method :owner_check


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
