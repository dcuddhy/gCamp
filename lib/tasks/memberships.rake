namespace :orphaned do
  desc "delete orphaned memberships"
  task memberships: :environment do
    Membership.where.not(user_id: User.all).delete_all
    Membership.where.not(project_id: Project.all).delete_all
  end
end
