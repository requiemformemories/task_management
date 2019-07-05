class TagTaskship < ApplicationRecord
  validates_presence_of :tag_id, :task_id
  belongs_to :tag
  belongs_to :task
end
