class UserTaskship < ApplicationRecord
  validates_presence_of :user_id, :task_id
  belongs_to :user
  belongs_to :task
end
