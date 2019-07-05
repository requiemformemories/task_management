require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe "#index" do
    let(:task1) { Task.create(:end_time => "2019-12-01 10:00:00", :topic => "task", :status => 0, :priority => 0) }
    let(:task2) { Task.create(:end_time => "2019-01-01 10:00:00", :topic => "task", :status => 0, :priority => 0) }
    
    it "order by created_at" do
      correct_order = [task1, task2]
      get :index
      expect(assigns(:tasks)).to match_array correct_order
    end
    
    it "order by end_time" do
      correct_order = [task2, task1]
      get :index, params: {order: :end_time}
      expect(assigns(:tasks)).to match_array correct_order
    end
  end    
end