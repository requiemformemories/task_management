require "rails_helper"

RSpec.feature "searching and sorting tasks", :type => :feature do

  context "verified" do  
    let!(:task1) { Task.create(topic: "bc", priority: 2, status: "finished", end_time: "2019-01-03 09:00:00") }
    let!(:task2) { Task.create(topic: "a", priority: 1, status: "in_progress", end_time: "2019-01-02 09:00:00") }
    let!(:task3) { Task.create(topic: "c", priority: 0, status: "pending", end_time: "2019-01-01 09:00:00") }
  
    scenario 'search topics that contain "c"' do
      visit "/tasks"
      fill_in 'q[topic_cont]', with: 'c'
      click_button "搜尋"
      topics = page.all(".topic").map(&:text)
      expect(topics).to eq ["bc", "c"]
    end
    
    scenario 'search tasks which status is "finished"' do
      visit "/tasks"
      select(I18n.t("task.finished"), from: 'q[status_eq]')
      click_button "搜尋"
      topics = page.all(".topic").map(&:text)
      expect(topics).to eq ["bc"]
    end
    
    scenario 'order by end_time ASC' do
      visit "/tasks"
      select(I18n.t("task.finished"), from: 'q[status_eq]')
      click_link I18n.t("task.end_time")
      topics = page.all(".topic").map(&:text)
      expect(topics).to eq ["c","a","bc"]
    end
  end
  
end  
