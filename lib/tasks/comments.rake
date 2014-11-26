namespace :orphaned do
  desc "delete orphaned comments"
  task comments: :environment do
    Comment.where.not(user_id: User.all).delete_all
    Comment.where.not(task_id: Task.all).delete_all
  end
end
