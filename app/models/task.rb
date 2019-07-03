class Task < ApplicationRecord
  before_create :generate_id, :fill_status

  validates_uniqueness_of :taskid
  validates_presence_of :topic
  belongs_to :category, optional: true
  has_many :user_taskships
  has_many :users, :through => :user_taskships
  has_many :tag_taskships
  has_many :tags, :through => :tag_taskships

  private
  def generate_id
    self.taskid = SecureRandom.uuid
  end

  def fill_status
    self.status ||= 0
  end
end
