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
end
