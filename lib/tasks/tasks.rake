namespace :orphaned do
  desc "delete orphaned tasks"
  task tasks: :environment do
    Task.where.not(project_id: Project.all).delete_all
  end
end
