require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:passwd) }
  it { is_expected.to validate_presence_of(:role) }
  subject { User.create(:name => "name", :username => "username", :passwd => "secr**", :role => 0) }
  it { is_expected.to validate_uniqueness_of(:username) }
  
  describe "validations" do
    let(:user) { User.new(:name => "name", :username => "username", :passwd => "secr**", :role => 0) }
    
    it "should pass" do #failed when generate_id in trouble
    end
    
  end
end
