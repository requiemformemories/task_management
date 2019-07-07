module TasksHelper
  def status_text(status)
    case status
      when "pending"
        return t("task.pending")
      when "in_progress"
        return t("task.in_progress")
      when "finished"
        return t("task.finished")
      else
        return ""
    end
  end
  
  def priority_text(priority)
    case priority
      when 0
        return t("task.priority_0")
      when 1
        return t("task.priority_1")
      when 2
        return t("task.priority_2")
      else
        return ""
    end    
  end
  
  def status_options
     id = Task.aasm.states.map &:name
     name = id.map {|e| I18n.t("task."+e.to_s) }
     return name.zip(id).to_h
  end  
  
  def priority_options
    return [[t('task.priority_0'), 0], [t('task.priority_1'), 1], [t('task.priority_2'), 2]]
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
  
end
