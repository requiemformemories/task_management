require "rails_helper"

RSpec.feature "managing tasks", :type => :feature do
  
  scenario "task with start_time and end_time" do
    visit "/tasks"
    within("form#new_task") do
      fill_in "task[start_time]", :with => "2019-01-01 09:00:00"
      fill_in "task[end_time]", :with => "2019-02-01 18:00:00"
    end
    click_button '新增'
    click_link '展開'
    expect(page).to have_content '2019-01-01 09:00:00'
    expect(page).to have_content '2019-02-01 18:00:00'
  end
  
  scenario "status:待處理" do
    visit "/tasks"
    within("form#new_task") do
      select('待處理', from: 'task[status]')
    end
    click_button '新增'
    click_link '展開'
    expect(page).to have_content '待處理'
  end
  
  scenario "status:進行中" do
    visit "/tasks"
    within("form#new_task") do
      select('進行中', from: 'task[status]')
    end
    click_button '新增'
    click_link '展開'
    expect(page).to have_content '進行中'
  end
  
  scenario "status:已完成" do
    visit "/tasks"
    within("form#new_task") do
      select('已完成', from: 'task[status]')
    end
    click_button '新增'
    click_link '展開'
    expect(page).to have_content '已完成'
  end
  
  scenario "priority:低" do
    visit "/tasks"
    within("form#new_task") do
      select('低', from: 'task[priority]')
    end
    click_button '新增'
    click_link '展開'
    expect(page).to have_content '低'
  end
  
  scenario "priority:中" do
    visit "/tasks"
    within("form#new_task") do
      select('中', from: 'task[priority]')
    end
    click_button '新增'
    click_link '展開'
    expect(page).to have_content '中'
  end
  
  scenario "priority:高" do
    visit "/tasks"
    within("form#new_task") do
      select('高', from: 'task[priority]')
    end
    click_button '新增'
    click_link '展開'
    expect(page).to have_content '高'
  end
end  
