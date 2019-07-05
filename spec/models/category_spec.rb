require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { Category.create(:catname => "catname") }
  it { is_expected.to validate_presence_of(:catname) }
  it { is_expected.to validate_uniqueness_of(:catname) }
  
end
