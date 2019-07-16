module TasksHelper
  
  def status_options
    id = Task.aasm.states.map &:name
    name = id.map {|e| I18n.t("task."+e.to_s) }
    return name.zip(id).to_h
  end  
  
  def priority_options
    return Task.priorities.keys.map {|p| [t(p, scope: :task), p]}.to_h
  end 
  
  def status_color
    {pending: "text-secondary", in_progress: "text-info", finished: "text-primary"}
  end
  
  def priority_color
    {low: "text-success", medium: "text-warning", high: "text-danger"}
  end


  def task_aasm_link(task)
    case task.status
      when "pending"
        return link_to t("task.processing"), task_processing_path(task.taskid), method: "post", class: "btn btn-primary" 
      when "in_progress"
        return link_to t("task.finish"),  task_finish_path(task.taskid), method: "post", class: "btn btn-success"  
      else
        return ""
    end
  end
  
  def users_list(task)
    if !task.nil?
      users_arr = task.users.map {|e| e.name}
      return users_arr.join(', ')
    end  
  end
end
