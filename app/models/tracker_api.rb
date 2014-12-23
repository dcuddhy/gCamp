class TrackerAPI

  def initialize
    @conn = Faraday.new(:url => 'https://www.pivotaltracker.com')
  end

  def projects(token)
      response = @conn.get do |req|
        req.url "/services/v5/projects"
        req.headers['Content-Type'] = 'application/json'
        req.headers['X-TrackerToken'] = token
    end
    JSON.parse(response.body, symbolize_names: true)
  end


  def stories(token, project_id)
    response = @conn.get do |req|
      req.url "/services/v5/projects/#{project_id}/stories?limit=500"
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-TrackerToken'] = token

    end
    JSON.parse(response.body, symbolize_names: true)
  end


end



#tracker_api.tracker_projects('2b1bfe8cbc1d12537d1c21b26312de4f')
