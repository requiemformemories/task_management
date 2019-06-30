class Tag < ApplicationRecord
  validates_presence_of :tagid, :tagname
  validates_uniqueness_of :tagid
  has_many :tag_taskships
  has_many :tasks, :through => :tag_taskships
end
