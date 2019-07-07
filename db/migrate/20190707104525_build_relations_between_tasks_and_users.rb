class BuildRelationsBetweenTasksAndUsers < ActiveRecord::Migration[5.2]
  def change
    if ! User.any?
      return
    end  
    user = User.first
    tasks = Task.includes(:users)
    tasks.all.each do |task|
      if ! task.users.any? 
        UserTaskship.create(task: task, user: user)    
      end
    end
  end
end
