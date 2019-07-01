class TagTaskship < ApplicationRecord
  validates_presence_of :ttid, :tag, :task
  validates_uniqueness_of :ttid
  belongs_to :tag
  belongs_to :task
end
