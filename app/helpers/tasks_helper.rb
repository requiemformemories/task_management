module TasksHelper
  def status_text(status)
    case status
      when 0
        return t("task.status_0")
      when 1
        return t("task.status_1")
      when 2
        return t("task.status_2")
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
end
