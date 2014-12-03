class ApplicationController < ActionController::Base
  # PrUser CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
      protect_from_forgery with: :exception


  def current_user
    User.find_by(id: session[:user_id])
  end


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
      redirect_to signin_path, notice: 'You must be logged in to access that action'
    end
  end

end
