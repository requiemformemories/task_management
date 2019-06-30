class Task < ApplicationRecord
  validates_presence_of :taskid, :status
  validates_uniqueness_of :taskid
  belongs_to :category
  has_many :user_taskships
  has_many :users, :through => :user_taskships
  has_many :tag_taskships
  has_many :tags, :through => :tag_taskships
end
