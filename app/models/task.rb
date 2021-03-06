class Task < ApplicationRecord
  include AASM
  before_validation :generate_id, on: :create

  enum priority: [ :low, :medium, :high ]

  validates_uniqueness_of :taskid
  validates_presence_of :taskid, :topic, :status, :priority
  validate :end_time_after_start_time
  belongs_to :category, optional: true
  has_many :user_taskships
  has_many :users, :through => :user_taskships, :dependent => :destroy
  has_many :tag_taskships
  has_many :tags, :through => :tag_taskships
  
  aasm column: :status do
    state :pending, initial: true
    state :in_progress, :finished
    
    event :process do
      transitions from: :pending, to: :in_progress
    end

    event :finish do
      transitions from: :in_progress, to: :finished
    end
  end
  
  def end_time_after_start_time
    if self.end_time.present? && self.start_time.present?
      if self.end_time <= self.start_time   
        errors[:end_time] <<  I18n.t("task.end_time_after_start_time") 
      end
    end
  end
  
  def insert_tags(tags)
    self.tags = tags.split(",").map do |name|
        Tag.where(tagname: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:tagname).join(", ")
  end
  
  def self.tagged_with(tagname)
    self.joins(:tags).where("tags.tagname" => tagname)
  end

  private
  def generate_id
    self.taskid = SecureRandom.uuid
  end

end
