module TasksHelper
  def status_text(status)
    case status
      when 0
        return "待處理" 
      when 1
        return "進行中"
      when 2
        return "已完成"
      else
        return ""
    end
  end
  
  def priority_text(priority)
    case priority
      when 0
        return "低" 
      when 1
        return "中"
      when 2
        return "高"
      else
        return ""
    end    
  end      
end
