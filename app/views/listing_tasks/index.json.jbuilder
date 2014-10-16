json.array!(@listing_tasks) do |listing_task|
  json.extract! listing_task, :id, :description
  json.url listing_task_url(listing_task, format: :json)
end
