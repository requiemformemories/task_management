require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:role) }
  subject { User.create(:name => "name", :username => "username", :password => "secr**", :password_confirmation => "secr**", :role => 0) }
  it { is_expected.to validate_uniqueness_of(:username) }
  
  describe "validations" do
    let(:user) { User.new(:name => "name", :username => "username", :password => "secr**", :password_confirmation => "secr**",:role => 0) }
    
    it "should pass" do #failed when generate_id in trouble
    end
  end
  
  describe "when user is destroyed" do
    let(:adminuser) { User.new(:name => "name", :username => "username", :password => "secr**", :password_confirmation => "secr**",:role => 0) }
    let(:user) { User.new(:name => "name", :username => "username", :password => "secr**", :password_confirmation => "secr**",:role => 0) }
    let(:task) { Task.new(:topic => "task", :priority => 0) }
    let(:ship) { UserTaskship.new(:task => task, :user => user) }
    
    it "will delete tasks" do
      user.destroy
      expect(Task.all.any?).to be false
    end
    
    it "cannot delete last admin" do
      adminuser.destroy
      expect(adminuser.errors.messages[:role]).to eq( I18n.t('user.need_last_admin') )
    end
    
  end
end
