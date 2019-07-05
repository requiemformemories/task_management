require 'rails_helper'

RSpec.describe Tag, type: :model do
  subject { Tag.create(:tagname => "tagname") }
  it { is_expected.to validate_presence_of(:tagname) }
  it { is_expected.to validate_uniqueness_of(:tagname) }
  
end
