class User < ApplicationRecord
  before_validation :generate_id, on: :create
  
  validates_presence_of :uid, :name, :username, :passwd, :role
  validates_uniqueness_of :uid, :username
  has_many :user_taskships
  has_many :tasks, :through => :user_taskships
  
  private
  def generate_id
    self.uid = SecureRandom.uuid
  end
end
