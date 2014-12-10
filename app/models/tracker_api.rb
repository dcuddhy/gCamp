class TrackerAPI

  def initialize
  conn = Faraday.new(:url => 'https://www.pivotaltracker.com')
  end

  def tracker_projects(token)
    response = conn.get do |req|
      req.url "/services/v5/projects"
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-TrackerToken'] = token
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
