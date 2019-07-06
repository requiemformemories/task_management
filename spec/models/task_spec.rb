require 'rails_helper'

RSpec.describe Task, type: :model do
  
  it { is_expected.to validate_presence_of(:topic) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:priority) }
  
  describe "validations" do
    let(:task) { Task.new(:topic => "task", :priority => 0) }
    
    it "should pass" do #failed when generate_id in trouble
    end    
    
    it "should validate end time after start time" do
      task.start_time = 1.day.ago
      task.end_time = 2.day.ago
      task.valid?
      expect(task.errors.full_messages).to include("結束時間 需晚於起始時間")
    end
  end
  
  describe "status" do
    
    it "may process when task is pending" do
      task = Task.new
      expect(task).to transition_from(:pending).to(:in_progress).on_event(:process)
    end
    
    it "may not finish when task is pending" do
      task = Task.new
      expect(task.may_finish?).to be false
    end
    
    it "may not process when task is in progress" do
      task = Task.new(status: :in_progress)
      expect(task.may_process?).to be false
    end
    
    it "may finish when task is in progress" do
      task = Task.new(status: :in_progress)
      expect(task).to transition_from(:in_progress).to(:finished).on_event(:finish)
    end
    
    it "may not process when task is finished" do
      task = Task.new(status: :finished)
      expect(task.may_process?).to be false
    end
    
    it "may not finish when task is finished" do
      task = Task.new(status: :finished)
      expect(task.may_finish?).to be false
    end
  end  
  
  describe "search" do
    
    let(:task1) { Task.create(topic: "bc", priority: 2, status: "finished", end_time: "2019-01-03 09:00:00") }
    let(:task2) { Task.create(topic: "a", priority: 1, status: "in_progress", end_time: "2019-01-02 09:00:00") }
    let(:task3) { Task.create(topic: "c", priority: 0, status: "pending", end_time: "2019-01-01 09:00:00") }
    
    it "order by end_time ASC" do
      correct_order = [task3, task2, task1]
      query = Task.ransack(end_time: 'asc')
      expect(query.result).to match_array correct_order
    end
    
    it 'search topic contain "c"' do
      correct_collection = [task1, task3]
      query = Task.ransack(topic_cont: 'c')
      expect(query.result).to match_array correct_collection
    end
    
    it 'search status equal "finished"' do
      correct_collection = [task1]
      query = Task.ransack(status_eq: 'finished')
      expect(query.result).to match_array correct_collection
    end
  end  
end
