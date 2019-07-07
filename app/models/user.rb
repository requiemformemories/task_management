class User < ApplicationRecord
  has_secure_password
  before_validation :generate_id, on: :create
  
  validates_presence_of :uid, :name, :username, :role
  validates_uniqueness_of :uid, :username
  validates :name, length: {maximum: 20}
  validates :username, length: {maximum: 20}
  has_many :user_taskships
  has_many :tasks, :through => :user_taskships
  
  private
  def generate_id
    self.uid = SecureRandom.uuid
  end
end
