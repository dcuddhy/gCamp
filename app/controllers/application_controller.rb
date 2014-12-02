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

end
