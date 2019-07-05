class Tag < ApplicationRecord
  validates_presence_of :tagname
  validates_uniqueness_of :tagname
  has_many :tag_taskships
  has_many :tasks, :through => :tag_taskships
end
