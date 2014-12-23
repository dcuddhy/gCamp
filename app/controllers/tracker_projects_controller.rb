class TrackerProjectsController < ApplicationController

  def index
    tracker_api = TrackerAPI.new
  end

  def show
    tracker_api = TrackerAPI.new
    @tracker_projects = tracker_api.projects(current_user.pivotal_tracker_token)
    @tracker_stories = tracker_api.stories(current_user.pivotal_tracker_token, params[:id])
  end



end
