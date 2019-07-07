require "rails_helper"

RSpec.feature "managing tasks", :type => :feature do
  
  scenario "task with start_time and end_time" do
    visit "/tasks"
    within("form#new_task") do
      fill_in "task[topic]", :with => "task with time"
      select(I18n.t("task.priority_0"), from: 'task[priority]')
      fill_in "task[start_time]", :with => "2019-01-01 09:00:00"
      fill_in "task[end_time]", :with => "2019-02-01 18:00:00"
    end
    click_button I18n.t("create")
    click_link I18n.t("show")
    expect(page).to have_content '01月01日 09:00'
    expect(page).to have_content '02月01日 18:00'
  end
  
  scenario "init a pending task" do
    visit "/tasks"
    within("form#new_task") do
      fill_in "task[topic]", :with => "task"
      select(I18n.t("task.priority_0"), from: 'task[priority]')
    end
    click_button I18n.t("create")
    click_link I18n.t("show")
    expect(page).to have_content I18n.t("task.pending")
  end
  
  scenario "status:in progress" do
    visit "/tasks"
    within("form#new_task") do
      fill_in "task[topic]", :with => "task"    
      select(I18n.t("task.priority_0"), from: 'task[priority]')
    end
    click_button I18n.t("create")
    click_link I18n.t("task.processing")
    expect(page).to have_content I18n.t("task.process_success")
    expect(page).to have_content I18n.t("task.in_progress")
  end
  
  scenario "status:in progress" do
    visit "/tasks"
    within("form#new_task") do
      fill_in "task[topic]", :with => "task"    
      select(I18n.t("task.priority_0"), from: 'task[priority]')
    end
    click_button I18n.t("create")
    click_link I18n.t("task.processing")
    click_link I18n.t("task.finish")
    expect(page).to have_content I18n.t("task.finish_success")
    expect(page).to have_content I18n.t("task.finished")
  end
  
  scenario "priority:low" do
    visit "/tasks"
    within("form#new_task") do
      fill_in "task[topic]", :with => "task with low priority" 
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
      select(I18n.t("task.priority_2"), from: 'task[priority]')
    end
    click_button I18n.t("create")
    click_link I18n.t("show")
    expect(page).to have_content I18n.t("task.priority_2")
  end
end  
