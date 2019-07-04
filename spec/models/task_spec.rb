require 'rails_helper'

RSpec.describe Task, type: :model do
  
  it { is_expected.to validate_presence_of(:topic) }
  it { is_expected.to validate_presence_of(:status) }
  it { is_expected.to validate_presence_of(:priority) }
  
  describe "validations" do
    let(:task) { Task.new(:topic => "task", :status => 0,:priority => 0) }
    
    it "should pass" do #failed when generate_id in trouble
    end    
    
    it "should validate end time after start time" do
      task.start_time = 1.day.ago
      task.end_time = 2.day.ago
      task.valid?
      expect(task.errors.full_messages).to include("結束時間 需晚於起始時間")
    end
  end
end
