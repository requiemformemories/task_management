require "rails_helper"

RSpec.feature "searching and sorting tasks", :type => :feature do

  context "searching and sorting" do  
    let!(:user) { User.create(:name => "name", :username => "username", :password => "secr**", :password_confirmation => "secr**",:role => 0) }
    let!(:task1) { Task.create(topic: "bc", priority: 1, status: "finished", end_time: "2019-01-03 09:00:00") }
    let!(:task2) { Task.create(topic: "a", priority: 2, status: "in_progress", end_time: "2019-01-02 09:00:00") }
    let!(:task3) { Task.create(topic: "c", priority: 0, status: "pending", end_time: "2019-01-01 09:00:00") }
    let!(:task4) { Task.create(topic: "c", priority: 0, status: "pending", end_time: "2019-01-01 09:00:00") }
    let!(:ship1) { UserTaskship.create(user: user, task: task1) }
    let!(:ship2) { UserTaskship.create(user: user, task: task2) }
    let!(:ship3) { UserTaskship.create(user: user, task: task3) }
    
    before :each do
      visit '/login'
      login user.username, user.password
    end
  
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
    
    scenario 'search tasks which tags include "aaa"' do
      task1.insert_tags("aaa,bbb,ccc")
      task2.insert_tags("bbb,ccc,ddd")
      task3.insert_tags("ccc,ddd,eee")
      task4.insert_tags("aaa,bbb,ccc")
      
      visit "/tasks"
      click_link "bbb(2)"
      topics = page.all(".topic").map(&:text)
      expect(topics).to eq ["bc","a"]
    end
    
    scenario 'order by end_time ASC' do
      visit "/tasks"
      click_link I18n.t("task.end_time")
      topics = page.all(".topic").map(&:text)
      expect(topics).to eq ["c","a","bc"]
    end
    
    scenario 'order by priority ASC' do
      visit "/tasks"
      click_link I18n.t("task.priority")
      topics = page.all(".topic").map(&:text)
      expect(topics).to eq ["c","bc","a"]
    end
  end
  
end 

private

def login(username, password)
  fill_in I18n.t('user.username'), with: username
  fill_in I18n.t('user.password'), with: password
  click_button I18n.t('user.login')
end
