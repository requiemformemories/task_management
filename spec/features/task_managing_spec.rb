require "rails_helper"

RSpec.feature "managing tasks", :type => :feature do
  
  scenario "task with start_time and end_time" do
    visit "/tasks"
    within("form#new_task") do
      fill_in "task[topic]", :with => "task with time"
      select(I18n.t("task.status_0"), from: 'task[status]')
      select(I18n.t("task.priority_0"), from: 'task[priority]')
      fill_in "task[start_time]", :with => "2019-01-01 09:00:00"
      fill_in "task[end_time]", :with => "2019-02-01 18:00:00"
    end
    click_button I18n.t("create")
    click_link I18n.t("show")
    expect(page).to have_content '2019-01-01 09:00:00'
    expect(page).to have_content '2019-02-01 18:00:00'
  end
  
  scenario "status:pending" do
    visit "/tasks"
    within("form#new_task") do
      fill_in "task[topic]", :with => "pending task"
      select(I18n.t("task.status_0"), from: 'task[status]')
      select(I18n.t("task.priority_0"), from: 'task[priority]')
    end
    click_button I18n.t("create")
    click_link I18n.t("show")
    expect(page).to have_content I18n.t("task.status_0")
  end
  
  scenario "status:in progress" do
    visit "/tasks"
    within("form#new_task") do
      fill_in "task[topic]", :with => "task in progress"    
      select(I18n.t("task.status_1"), from: 'task[status]')
      select(I18n.t("task.priority_0"), from: 'task[priority]')
    end
    click_button I18n.t("create")
    click_link I18n.t("show")
    expect(page).to have_content I18n.t("task.status_1")
  end
  
  scenario "status:finished" do
    visit "/tasks"
    within("form#new_task") do
      fill_in "task[topic]", :with => "task is finished"    
      select(I18n.t("task.status_2"), from: 'task[status]')
      select(I18n.t("task.priority_0"), from: 'task[priority]')
    end
    click_button I18n.t("create")
    click_link I18n.t("show")
    expect(page).to have_content I18n.t("task.status_2")
  end
  
  scenario "priority:low" do
    visit "/tasks"
    within("form#new_task") do
      fill_in "task[topic]", :with => "task with low priority" 
      select(I18n.t("task.status_0"), from: 'task[status]')
      select(I18n.t("task.priority_0"), from: 'task[priority]')
    end
    click_button I18n.t("create")
    click_link I18n.t("show")
    expect(page).to have_content I18n.t("task.priority_1")
  end
  
  scenario "priority:medium" do
    visit "/tasks"
    within("form#new_task") do
      fill_in "task[topic]", :with => "task with medium priority"  
      select(I18n.t("task.status_0"), from: 'task[status]')
      select(I18n.t("task.priority_1"), from: 'task[priority]')
    end
    click_button I18n.t("create")
    click_link I18n.t("show")
    expect(page).to have_content I18n.t("task.priority_1")
  end
  
  scenario "priority:high" do
    visit "/tasks"
    within("form#new_task") do
      fill_in "task[topic]", :with => "task with high priority"    
      select(I18n.t("task.status_0"), from: 'task[status]')
      select(I18n.t("task.priority_2"), from: 'task[priority]')
    end
    click_button I18n.t("create")
    click_link I18n.t("show")
    expect(page).to have_content I18n.t("task.priority_2")
  end
end  
