require 'rails_helper'

RSpec.describe TagTaskship, type: :model do
  it { is_expected.to validate_presence_of(:tag_id) }
  it { is_expected.to validate_presence_of(:task_id) }
  it { is_expected.to belong_to(:tag) }
  it { is_expected.to belong_to(:task) }
end
