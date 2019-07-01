class UserTaskship < ApplicationRecord
  validates_presence_of :utid, :user, :task
  validates_uniqueness_of :utid
  belongs_to :user
  belongs_to :task
end
